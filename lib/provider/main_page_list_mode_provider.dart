import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MainPageListMode {
  live,
  search,
}

final mainPageListModeProvider =
    StateProvider<MainPageListMode>((ref) => MainPageListMode.live);
