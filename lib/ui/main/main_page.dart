import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:fudiko/app_color.dart';
import 'package:fudiko/app_text_style.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/logger.dart';
import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:fudiko/provider/editing_search_text_provider.dart';
import 'package:fudiko/provider/is_playing_provider.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/safearea_provider.dart';
import 'package:fudiko/provider/search_editing_provider.dart';
import 'package:fudiko/provider/station_list_provider.dart';
import 'package:fudiko/ui/component/bouncing.dart';
import 'package:fudiko/ui/main/main_page_action.dart';
import 'package:fudiko/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

part 'bottom_view.dart';
part 'highlight_bar.dart';
part 'play_button.dart';
part 'program_list.dart';
part 'search_bar.dart';
part 'search_result_list.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  static const String routeName = 'main_page';

  static final focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemHeight = 100.0;

    final programList = ref.watch(nowOnAirProgramListProvider);
    ref.watch(audioPlayerProvier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: programList.when(
        data: (v) {
          return Stack(
            children: [
              // List, Divider, BottomView
              Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        const Center(
                          child: _HighlightBar(height: itemHeight),
                        ),
                        _ProgramList(
                          stationIds: v.keys.toList(),
                          programs: v.values.toList(),
                          itemHeight: itemHeight,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 8,
                    indent: 8,
                    endIndent: 8,
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
                      SizedBox(width: ref.watch(searchEditingProvider) ? 8 : 0),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => primaryFocus?.unfocus(),
                        child: SizedBox(
                          height: 48,
                          child: Center(
                            child: Text(
                              ref.watch(searchEditingProvider) ? 'Cancel' : '',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Text(''),
        error: (error, stack) => Text(error.toString()),
      ),
    );
  }
}
