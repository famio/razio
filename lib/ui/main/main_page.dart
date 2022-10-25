import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/app_color.dart';
import 'package:fudiko/app_text_style.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:fudiko/provider/pageview_controller_provider.dart';
import 'package:fudiko/provider/play_controller_provider.dart';
import 'package:fudiko/provider/program_list_provider.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:fudiko/provider/selected_station_on_air_program_provider.dart';
import 'package:fudiko/provider/station_list_provider.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'play_controller.dart';
part 'program_list.dart';
part 'program_thumbnail.dart';
part 'station_list.dart';
part 'station_page_view.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static const String title = 'fudiko';
  static const String routeName = 'station_list_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stations = ref.watch(stationListProvider);
    return Scaffold(
      body: stations.when(
        data: (data) {
          return SafeArea(
            child: Column(
              children: const [
                Expanded(
                  child: _StationPageView(),
                ),
                _StationList(),
                _PlayController(),
              ],
            ),
          );
        },
        error: (error, stack) => Text('$error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
