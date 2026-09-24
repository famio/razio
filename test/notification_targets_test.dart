import 'package:flutter_test/flutter_test.dart';
import 'package:razio/entity/search.dart';
import 'package:razio/notification/program_notification_service.dart';

SearchProgram _program(String stationId, String title, DateTime start) {
  return SearchProgram(
    tsInNg: 0,
    metas: [],
    tsOutNg: 0,
    stationId: stationId,
    programUrl: Uri(),
    status: 'future',
    startTimeS: '',
    genre: SearchProgramGenre(),
    title: title,
    endTimeS: '',
    performer: '',
    startTime: start,
    endTime: start.add(const Duration(hours: 1)),
    programDate: '',
    info: '',
    img: Uri(),
    description: '',
  );
}

void main() {
  test('帯番組の続けて放送される枠は最初の枠だけを通知する', () {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final day1 = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 17);
    final day2 = day1.add(const Duration(days: 1));
    final programs = [
      _program('TBS', '荻上チキ・Session (3)', day1.add(const Duration(hours: 2))),
      _program('TBS', '荻上チキ・Session (1)', day1),
      _program('TBS', '荻上チキ・Session (2)', day1.add(const Duration(hours: 1))),
      _program('TBS', '荻上チキ・Session (1)', day2),
      _program('TBS', '荻上チキ・Session (2)', day2.add(const Duration(hours: 1))),
      // 別の局の同じ時刻の番組は別に通知する
      _program('QRR', '荻上チキ・Session (2)', day1.add(const Duration(hours: 1))),
    ];

    final targets = ProgramNotificationService.notificationTargets(programs)
        .map((e) => (e.stationId, e.startTime))
        .toList();

    expect(targets, [
      ('TBS', day1),
      ('QRR', day1.add(const Duration(hours: 1))),
      ('TBS', day2),
    ]);
  });

  test('放送中の枠に続く枠は通知しない', () {
    final start = DateTime.now().subtract(const Duration(minutes: 30));
    final programs = [
      _program('TBS', '荻上チキ・Session (1)', start),
      _program('TBS', '荻上チキ・Session (2)', start.add(const Duration(hours: 1))),
    ];

    expect(ProgramNotificationService.notificationTargets(programs), isEmpty);
  });
}
