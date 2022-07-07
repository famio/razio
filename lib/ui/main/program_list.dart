part of 'main_page.dart';

class _ProgramList extends ConsumerWidget {
  const _ProgramList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programList = ref.watch(selectedStationTodaysProgramListProvider);
    return programList.when(
        data: (data) {
          if (data == null) {
            return Text('null');
          } else {
            return ListView.builder(
              itemCount: data.length, // この行を追加
              itemBuilder: (BuildContext context, int index) {
                return Text(data[index].title);
              },
            );
          }
        },
        error: (error, trace) => Text('error'),
        loading: () => Text('loading'));
  }
}
