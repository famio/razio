import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/station_list_provider.dart';

final progressProvider = Provider<bool>((ref) {
  if (ref.watch(authProvider).when(
      data: (data) => false,
      error: (error, stack) => false,
      loading: () => true)) {
    return true;
  }
  if (ref.watch(stationListProvider).when(
      data: (data) => false,
      error: (error, stack) => false,
      loading: () => true)) {
    return true;
  }
  return false;
});
