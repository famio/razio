import 'package:fudiko/entity/station.dart';
import 'package:fudiko/provider/selected_station_id_provider.dart';
import 'package:fudiko/provider/station_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedStationProvider = Provider<Station?>(
  (ref) {
    final selectedStationId = ref.watch(selectedStationIdProvider);
    final stations = ref.watch(stationListProvider);
    final station = stations.whenOrNull(
      data: (data) => data.firstWhere(
        (station) => station.id == selectedStationId,
      ),
    );
    return station;
  },
);
