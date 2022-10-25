import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/provider/station_list_provider.dart';

final selectedStationIdProvider = StateProvider<String?>(
  (ref) => ref.read(stationListProvider).maybeWhen(
        data: (data) => data.first.id,
        orElse: () => null,
      ),
);
