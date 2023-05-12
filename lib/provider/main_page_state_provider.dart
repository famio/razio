import 'package:fudiko/provider/now_on_air_program_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MainPageState {
  loading,
  list,
  error,
}

final mainPageStateProvider = Provider<MainPageState>((ref) {
  ref.listen(nowOnAirProgramListProvider, (previous, next) {
    if (next.isLoading && ref.state == MainPageState.error) {
      ref.state = MainPageState.loading;
    } else if (next.hasError && ref.state != MainPageState.error) {
      ref.state = MainPageState.error;
    } else if (next.hasValue && ref.state != MainPageState.list) {
      ref.state = MainPageState.list;
    }
  });
  return MainPageState.loading;
});
