import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:razio/entity/main_page_list_item.dart';
import 'package:razio/entity/search.dart';
import 'package:razio/logger.dart';
import 'package:razio/notification/program_notification_service.dart';
import 'package:razio/provider/app_lifecycle_provider.dart';
import 'package:razio/provider/audio_player_provider.dart';
import 'package:razio/provider/auth_provider.dart';
import 'package:razio/provider/editing_search_text_provider.dart';
import 'package:razio/provider/favorite_list_provider.dart';
import 'package:razio/provider/favorite_program_list_provider.dart';
import 'package:razio/provider/main_page_list_mode_provider.dart';
import 'package:razio/provider/now_on_air_program_list.dart';
import 'package:razio/provider/playback_timeline_provider.dart';
import 'package:razio/provider/search_bar_controller_provider.dart';
import 'package:razio/provider/search_keyword_provider.dart';
import 'package:razio/provider/search_result_list_provider.dart';
import 'package:razio/provider/selected_search_program_provider.dart';
import 'package:razio/provider/selected_station_id_provider.dart';

Timer? _timer;

final mainPageActionProvider =
    StateNotifierProvider<MainPageAction, void>((ref) {
  // アプリがForegroundになったら認証情報を更新する
  ref.listen<AppLifecycleState>(
    appLifecycleProvider,
    (previous, next) {
      switch (next) {
        case AppLifecycleState.resumed:
          final _ = ref.refresh(authProvider);
          // お気に入り番組の放送予定を取得し直して通知を予約し直す
          ref.invalidate(favoriteUpcomingProgramListProvider);
        case AppLifecycleState.inactive:
        case AppLifecycleState.paused:
        case AppLifecycleState.detached:
        case AppLifecycleState.hidden:
          break;
      }
    },
  );

  // お気に入り番組の放送予定が更新されたら通知を予約し直す
  ref.listen<AsyncValue<List<SearchProgram>>>(
    favoriteUpcomingProgramListProvider,
    (previous, next) => next.whenData(ProgramNotificationService.reschedule),
  );

  // 放送開始の通知がタップされたら、その局のLive放送を再生する
  void playTappedStation() {
    final stationId = ProgramNotificationService.tappedStationId.value;
    final programs = ref.read(nowOnAirProgramListProvider).valueOrNull;
    if (stationId == null || programs == null) {
      return;
    }
    ProgramNotificationService.tappedStationId.value = null;
    if (!programs.any((element) => element.stationId == stationId)) {
      return;
    }
    ref.read(mainPageListModeProvider.notifier).state = MainPageListMode.live;
    ref.read(selectedSearchProgramProvider.notifier).state = null;
    ref.read(selectedLiveStationIdProvider.notifier).state = stationId;
    // 再生状態にしておくと、AudioSourceの読み込み後に再生が始まる
    unawaited(audioPlayer.play());
  }

  ProgramNotificationService.tappedStationId.addListener(playTappedStation);
  ref.onDispose(
    () => ProgramNotificationService.tappedStationId
        .removeListener(playTappedStation),
  );

  ref.watch(nowOnAirProgramListProvider).whenData((programs) {
    // Providerの初期化中は他のProviderを変更できないため、初期化後に処理する
    scheduleMicrotask(playTappedStation);
    final now = DateTime.now();
    final program = programs.sortedBy((element) => element.endTime).first;
    if (program.endDate.isAfter(now)) {
      final diff = program.endDate.difference(now);
      if (_timer != null && _timer!.isActive) {
        _timer!.cancel();
      }
      _timer = Timer(diff, () => ref.refresh(nowOnAirProgramListProvider));
    } else {
      ref.invalidate(nowOnAirProgramListProvider);
    }
  });

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
    _selectedItemChangedTimer = Timer(const Duration(milliseconds: 300), () {
      switch (_ref.read(mainPageListModeProvider)) {
        case MainPageListMode.live:
          final programList = _ref.read(nowOnAirProgramListProvider).value;
          if (programList == null) {
            return;
          }
          final stationId = programList[index].stationId;
          _ref.read(selectedLiveStationIdProvider.notifier).state = stationId;
        case MainPageListMode.search:
          _selectTimefreeListItem(index, _ref.read(searchResultListProvider));
        case MainPageListMode.favorite:
          _selectTimefreeListItem(
            index,
            _ref.read(favoriteAvailableProgramListProvider),
          );
      }
    });
  }

  /// 検索・お気に入りのリストでアイテムを選択した時の処理
  /// 先頭(index 0)はLive放送の番組で、それ以降はタイムフリーの番組
  void _selectTimefreeListItem(
    int index,
    AsyncValue<List<SearchProgram>> programs,
  ) {
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
      final program = programs.valueOrNull?.elementAtOrNull(index - 1);
      if (program == null) {
        return;
      }
      _ref.read(selectedSearchProgramProvider.notifier).state = program;
    }
  }

  Future<void> onPlayButton() async {
    final timeline = _ref.read(playbackTimelineProvider);
    if (audioPlayer.playing) {
      // Live放送の最新位置を再生中の場合は停止し、再開時に最新位置から再生する
      if (timeline == null || timeline.isAtLiveEdge) {
        await audioPlayer.stop();
      } else {
        await audioPlayer.pause();
      }
    } else {
      await _ref.read(playbackTimelineProvider.notifier).resume();
    }
  }

  /// シークバーで再生位置が指定された時に呼ばれる
  Future<void> onSeek(DateTime target) async {
    unawaited(HapticFeedback.lightImpact());
    await _ref.read(playbackTimelineProvider.notifier).seek(target);
  }

  /// シークバーでLive放送に戻す操作をされた時に呼ばれる
  Future<void> onSeekToLive() async {
    unawaited(HapticFeedback.lightImpact());
    await _ref.read(playbackTimelineProvider.notifier).seekToLive();
  }

  /// 各アイテムのタップ時に呼ばれる
  void onItemTapCallback(int index) {
    log.info('onItemTapCallback: $index');
  }

  /// 各アイテムの★ボタンのタップ時に呼ばれる
  Future<void> onFavoriteButton(MainPageListItem item) async {
    unawaited(HapticFeedback.lightImpact());
    await _ref.read(favoriteListProvider.notifier).toggle(item);
  }

  /// お気に入りリストの表示を切り替える
  void onFavoriteModeButton() {
    unawaited(HapticFeedback.selectionClick());
    if (_ref.read(mainPageListModeProvider) == MainPageListMode.favorite) {
      _ref.read(mainPageListModeProvider.notifier).state =
          MainPageListMode.live;
      return;
    }
    onSearchCancelButton();
    _ref.read(mainPageListModeProvider.notifier).state =
        MainPageListMode.favorite;
    final _ = _ref.refresh(favoriteAvailableProgramListProvider);
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
