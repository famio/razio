import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiko/app_color.dart';
import 'package:fudiko/app_text_style.dart';
import 'package:fudiko/entity/main_page_list_item.dart';
import 'package:fudiko/gen/assets.gen.dart';
import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:fudiko/provider/editing_search_text_provider.dart';
import 'package:fudiko/provider/is_playing_provider.dart';
import 'package:fudiko/provider/main_page_list_item_provider.dart';
import 'package:fudiko/provider/main_page_list_mode_provider.dart';
import 'package:fudiko/provider/main_page_state_provider.dart';
import 'package:fudiko/provider/safearea_provider.dart';
import 'package:fudiko/provider/search_bar_controller_provider.dart';
import 'package:fudiko/provider/search_editing_provider.dart';
import 'package:fudiko/ui/component/bouncing.dart';
import 'package:fudiko/ui/main/main_page_action.dart';
import 'package:fudiko/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'background.dart';
part 'bottom_view.dart';
part 'highlight_bar.dart';
part 'play_button.dart';
part 'program_list.dart';
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
          const _BackGround(),
          // List, Divider, BottomView
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
                      return ref.watch(mainPageListItemProvider).isEmpty
                          ? const Center(
                              child: Text('Program not found'),
                            )
                          : const Stack(
                              children: [
                                Center(
                                  child: _HighlightBar(height: itemHeight),
                                ),
                                _ProgramList(
                                  itemHeight: itemHeight,
                                ),
                              ],
                            );
                  }
                })(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: Blur(
                  blur: 4,
                  colorOpacity: 0.3,
                  borderRadius: BorderRadius.all(Radius.circular(1.5)),
                  child: SizedBox(height: 3, width: double.infinity),
                ),
              ),
              const _BottomView(),
            ],
          ),
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
