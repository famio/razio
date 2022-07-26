import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/entity/program.dart';
import 'package:fudiko/entity/station.dart';
import 'package:fudiko/provider/audio_player_provider.dart';
import 'package:fudiko/provider/play_controller_provider.dart';
import 'package:fudiko/provider/selected_station_on_air_program_provider.dart';
import 'package:fudiko/provider/selected_station_provider.dart';
import 'package:fudiko/provider/selected_station_todays_program_list_provider.dart';
import 'package:fudiko/provider/station_list_provider.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'play_controller.dart';
part 'program_thumbnail.dart';
part 'program_list.dart';
part 'station_list.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String title = 'fudiko';
  static const String routeName = 'station_list_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stations = ref.watch(stationListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: stations.when(
        data: (data) {
          return Column(
            children: [
              const _ProgramThumbnail(),
              _StationList(data),
              const Expanded(child: _ProgramList()),
              const _PlayController(),
            ],
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
