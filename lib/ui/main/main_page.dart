import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/app_color.dart';
import 'package:fudiko/app_text_style.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:fudiko/provider/is_playing_provider.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/station_list_provider.dart';
import 'package:fudiko/ui/component/bouncing.dart';
import 'package:fudiko/ui/main/main_page_action.dart';
import 'package:fudiko/ui/search/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

part 'bottom_view.dart';
part 'highlight_bar.dart';
part 'play_button.dart';
part 'program_list.dart';
part 'search_button.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static const String routeName = 'main_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemHeight = 100.0;

    final programList = ref.watch(nowOnAirProgramListProvider);
    ref.watch(audioPlayerProvier);

    return Scaffold(
      body: programList.when(
        data: (v) {
          return Column(
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
          );
        },
        loading: () => const Text(''),
        error: (error, stack) => Text(error.toString()),
      ),
    );
  }
}
