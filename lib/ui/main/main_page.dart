import 'dart:async';
import 'dart:math';
import 'dart:ui' show ImageFilter;

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:razio/app_color.dart';
import 'package:razio/app_text_style.dart';
import 'package:razio/entity/background_circle_parameters.dart';
import 'package:razio/entity/main_page_list_item.dart';
import 'package:razio/gen/assets.gen.dart';
import 'package:razio/provider/audio_player_provider.dart';
import 'package:razio/provider/editing_search_text_provider.dart';
import 'package:razio/provider/is_playing_provider.dart';
import 'package:razio/provider/main_page_list_item_provider.dart';
import 'package:razio/provider/main_page_list_mode_provider.dart';
import 'package:razio/provider/main_page_state_provider.dart';
import 'package:razio/provider/playback_timeline_provider.dart';
import 'package:razio/provider/safearea_provider.dart';
import 'package:razio/provider/search_bar_controller_provider.dart';
import 'package:razio/provider/search_editing_provider.dart';
import 'package:razio/ui/component/bouncing.dart';
import 'package:razio/ui/main/main_page_action.dart';
import 'package:razio/util.dart';

part 'background.dart';
part 'bottom_divider.dart';
part 'bottom_view.dart';
part 'highlight_bar.dart';
part 'play_button.dart';
part 'program_list.dart';
part 'search_background.dart';
part 'search_bar.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  static const String routeName = 'main_page';

  static final focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemHeight = 100.0;

    final state = ref.watch(mainPageStateProvider);
    ref.watch(audioPlayerProvier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: isLightMode(context)
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        flexibleSpace: const _GlassBackground(),
        title: const _SearchBar(),
        actions: [
          if (ref.watch(searchEditingProvider) ||
              ref.watch(mainPageListModeProvider) ==
                  MainPageListMode.search) ...[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => ref
                  .read(mainPageActionProvider.notifier)
                  .onSearchCancelButton(),
              child: const SizedBox(
                height: _SearchBar.height,
                child: Center(
                  child: Text('Cancel'),
                ),
              ),
            ),
            const SizedBox(width: 16, height: 8),
          ],
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(16),
          child: SizedBox(),
        ),
        toolbarHeight: _SearchBar.height,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          // アニメーションがCPUを食うのでコメントアウト
          // const _BackGround(),
          // List
          Positioned.fill(
            child: (() {
              switch (state) {
                case MainPageState.loading:
                  return const Text('');
                case MainPageState.error:
                  return const Center(
                    child: Text('Error :<'),
                  );
                case MainPageState.list:
                  return Stack(
                    children: [
                      const Center(
                        child: _HighlightBar(height: itemHeight),
                      ),
                      Visibility(
                        visible: ref.watch(mainPageListModeProvider) ==
                            MainPageListMode.live,
                        child: _ProgramList(
                          programs: ref.watch(mainPageLiveListItemProvider),
                          listMode: MainPageListMode.live,
                          itemHeight: itemHeight,
                        ),
                      ),
                      Visibility(
                        visible: ref.watch(mainPageListModeProvider) ==
                            MainPageListMode.search,
                        child: _ProgramList(
                          programs: ref.watch(mainPageSearchListItemProvider),
                          listMode: MainPageListMode.search,
                          itemHeight: itemHeight,
                        ),
                      ),
                    ],
                  );
              }
            })(),
          ),
          // Divider & SeekBar & BottomView
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            // シークバーのポップアップがはみ出して表示されるよう、切り取らない
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(child: _GlassBackground()),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _BottomDivider(),
                    SizedBox(
                      height: 2,
                    ),
                    _BottomView(),
                  ],
                ),
              ],
            ),
          ),
          // SearchBackground
          const _SearchBackground(),
        ],
      ),
    );
  }
}

/// リストの上に重ねるすりガラス状の背景
class _GlassBackground extends StatelessWidget {
  const _GlassBackground();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: ColoredBox(
          color: AppColor.background(context).withValues(alpha: 0.6),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
