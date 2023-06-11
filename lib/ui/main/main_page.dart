import 'dart:async';
import 'dart:math';

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background
          // アニメーションがCPUを食うのでコメントアウト
          // const _BackGround(),
          // List
          Column(
            children: [
              Expanded(
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
                              programs:
                                  ref.watch(mainPageSearchListItemProvider),
                              listMode: MainPageListMode.search,
                              itemHeight: itemHeight,
                            ),
                          ),
                        ],
                      );
                  }
                })(),
              ),
              // Divider
              const _BottomDivider(),
              const SizedBox(
                height: 12,
              ),

              // BottomView
              const _BottomView(),
            ],
          ),
          // SearchBackground
          const _SearchBackground(),
          // SearchBar
          SafeArea(
            left: false,
            bottom: false,
            right: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Flexible(child: _SearchBar()),
                  SizedBox(
                    width: ref.watch(searchEditingProvider) ||
                            ref.watch(mainPageListModeProvider) ==
                                MainPageListMode.search
                        ? 8
                        : 0,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => ref
                        .read(mainPageActionProvider.notifier)
                        .onSearchCancelButton(),
                    child: SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          ref.watch(searchEditingProvider) ||
                                  ref.watch(mainPageListModeProvider) ==
                                      MainPageListMode.search
                              ? 'Cancel'
                              : '',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
