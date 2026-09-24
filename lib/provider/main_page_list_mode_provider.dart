import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MainPageListMode {
  live,
  search,
  favorite,
}

final mainPageListModeProvider =
    StateProvider<MainPageListMode>((ref) => MainPageListMode.live);
