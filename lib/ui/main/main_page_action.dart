import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudiko/logger.dart';
import 'package:fudiko/provider/app_lifecycle_provider.dart';
import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/editing_search_text_provider.dart';
import 'package:fudiko/provider/main_page_list_mode_provider.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/search_bar_controller_provider.dart';
import 'package:fudiko/provider/search_keyword_provider.dart';
import 'package:fudiko/provider/search_result_list_provider.dart';
import 'package:fudiko/provider/selected_search_program_provider.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainPageActionProvider =
    StateNotifierProvider<MainPageAction, void>((ref) {
  // アプリがForegroundになったら認証情報を更新する
  ref.listen<AppLifecycleState>(
    appLifecycleProvider,
    (previous, next) {
      switch (next) {
        case AppLifecycleState.resumed:
          final _ = ref.refresh(authProvider);
        case AppLifecycleState.inactive:
        case AppLifecycleState.paused:
        case AppLifecycleState.detached:
          break;
      }
    },
  );

  return MainPageAction(ref);
});

class MainPageAction extends StateNotifier<void> {
  MainPageAction(this._ref) : super(null);

  final Ref _ref;
  Timer? _selectedItemChangedTimer;

  /// フォーカスしているアイテムの更新時に呼ばれる
  /// スクロール時には連続して複数回呼ばれる
  void onSelectedItemChanged(int index) {
    HapticFeedback.selectionClick();
    if (_selectedItemChangedTimer != null &&
        _selectedItemChangedTimer!.isActive) {
      _selectedItemChangedTimer!.cancel();
    }
    _selectedItemChangedTimer =
        Timer(const Duration(milliseconds: 300), () async {
      switch (_ref.read(mainPageListModeProvider)) {
        case MainPageListMode.live:
          final programList = _ref.read(nowOnAirProgramListProvider).value;
          if (programList == null) {
            return;
          }
          final stationId = programList[index].stationId;
          _ref.read(selectedLiveStationIdProvider.notifier).state = stationId;
        case MainPageListMode.search:
          if (index == 0) {
            // selectedLiveStationIdを同じ値で更新することで、Live放送側の番組を再生する
            final selectedLiveStationId =
                _ref.read(selectedLiveStationIdProvider.notifier).state;
            _ref.read(selectedLiveStationIdProvider.notifier).state = null;
            _ref.read(selectedLiveStationIdProvider.notifier).state =
                selectedLiveStationId;
            // Live放送側の番組を再生するため、selectedSearchProgramをnullにする
            _ref.read(selectedSearchProgramProvider.notifier).state = null;
          } else {
            final fixedIndex = index - 1;
            final program = _ref
                .read(searchResultListProvider)
                .whenData((value) => value[fixedIndex])
                .value;
            if (program == null) {
              return;
            }
            _ref.read(selectedSearchProgramProvider.notifier).state = program;
          }
      }
    });
  }

  Future<void> onPlayButton() async {
    if (audioPlayer.playing) {
      switch (_ref.read(mainPageListModeProvider.notifier).state) {
        case MainPageListMode.live:
          await audioPlayer.stop();
        case MainPageListMode.search:
          await audioPlayer.pause();
      }
    } else {
      await audioPlayer.play();
    }
  }

  /// 各アイテムのタップ時に呼ばれる
  void onItemTapCallback(int index) {
    log.info('onItemTapCallback: $index');
  }

  void onSearchSubmitted(String keyword) {
    if (keyword.isEmpty) {
      return;
    }
    _ref.read(mainPageListModeProvider.notifier).state =
        MainPageListMode.search;
    _ref.read(searchKeywordProvider.notifier).state = keyword;
    final _ = _ref.refresh(searchResultListProvider);
  }

  void onSearchCancelButton() {
    primaryFocus?.unfocus();
    _ref.read(mainPageListModeProvider.notifier).state = MainPageListMode.live;
    _ref.read(searchKeywordProvider.notifier).state = '';
    _ref.read(editingSearchTextProvider.notifier).state = '';
    _ref.read(searchBarControllerProvider).clear();
  }
}
