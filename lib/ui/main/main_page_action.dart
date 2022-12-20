import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/logger.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';

final mainPageActionProvider =
    StateNotifierProvider<MainPageAction, void>((ref) {
  return MainPageAction(ref);
});

class MainPageAction extends StateNotifier<void> {
  MainPageAction(this._ref) : super(null);

  final Ref _ref;
  Timer? _selectedItemChangedTimer;

  /// フォーカスしているアイテムの更新時に呼ばれる
  /// スクロール時には連続して複数回呼ばれる
  void onSelectedItemChanged(String stationId) {
    HapticFeedback.selectionClick();
    if (_selectedItemChangedTimer != null &&
        _selectedItemChangedTimer!.isActive) {
      _selectedItemChangedTimer!.cancel();
    }
    _selectedItemChangedTimer =
        Timer(const Duration(milliseconds: 300), () async {
      _ref.read(selectedStationIdProvider.notifier).state = stationId;
    });
  }

  /// 各アイテムのタップ時に呼ばれる
  void onItemTapCallback(int index) {
    log.info('onItemTapCallback: $index');
  }
}
