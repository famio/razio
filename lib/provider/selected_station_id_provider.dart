import 'package:fudiko/provider/station_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedStationIdProvider = StateProvider<String?>(
  (ref) => ref.read(stationListProvider).maybeWhen(
        data: (data) => data.first.id,
        orElse: () => null,
      ),
);
