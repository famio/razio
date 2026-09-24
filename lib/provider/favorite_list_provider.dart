import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:razio/entity/favorite_program.dart';
import 'package:razio/entity/main_page_list_item.dart';
import 'package:razio/notification/program_notification_service.dart';
import 'package:razio/provider/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoriteListProvider =
    StateNotifierProvider<FavoriteListNotifier, List<FavoriteProgram>>((ref) {
  return FavoriteListNotifier(ref.watch(sharedPreferencesProvider));
});

class FavoriteListNotifier extends StateNotifier<List<FavoriteProgram>> {
  FavoriteListNotifier(this._prefs) : super(_load(_prefs));

  static const _prefsKey = 'favorite_programs';

  final SharedPreferences _prefs;

  static List<FavoriteProgram> _load(SharedPreferences prefs) {
    final list = prefs.getStringList(_prefsKey) ?? [];
    // 以前は枠ごとのタイトルで保存していたため、同じ番組シリーズの重複を除く
    final keys = <String>{};
    return list
        .map(
          (e) => FavoriteProgram.fromJson(
            jsonDecode(e) as Map<String, dynamic>,
          ),
        )
        .where((e) => keys.add(e.key))
        .toList();
  }

  bool isFavorite(MainPageListItem item) {
    return state.any(
      (e) => e.matches(stationId: item.stationId, title: item.title),
    );
  }

  Future<void> toggle(MainPageListItem item) async {
    if (isFavorite(item)) {
      state = state
          .where(
            (e) => !e.matches(stationId: item.stationId, title: item.title),
          )
          .toList();
    } else {
      // 権限の確認中に通知を予約すると失敗するため、先に権限を要求する
      await ProgramNotificationService.requestPermission();
      state = [
        ...state,
        FavoriteProgram(
          stationId: item.stationId,
          title: seriesTitleOf(item.title),
          img: item.imageUrl,
        ),
      ];
    }
    await _prefs.setStringList(
      _prefsKey,
      state.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }
}
