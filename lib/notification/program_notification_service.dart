import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:razio/entity/favorite_program.dart';
import 'package:razio/entity/search.dart';
import 'package:razio/logger.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// お気に入り番組の放送開始を知らせるローカル通知
class ProgramNotificationService {
  ProgramNotificationService._();

  static final _plugin = FlutterLocalNotificationsPlugin();

  /// iOSは予約できる通知が64件までのため、余裕を持たせた件数に抑える
  static const _maxScheduledCount = 60;

  /// radikoの番組表の時刻は日本時間
  static late final tz.Location _location;

  static const _details = NotificationDetails(
    android: AndroidNotificationDetails(
      'dev.famio.razio.channel.program_start',
      'Program start',
      channelDescription: 'お気に入り番組の放送開始のお知らせ',
      importance: Importance.high,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
  );

  /// タップされた通知の放送局ID
  /// 処理した側がnullに戻す
  static final tappedStationId = ValueNotifier<String?>(null);

  static Future<void> init() async {
    tz.initializeTimeZones();
    _location = tz.getLocation('Asia/Tokyo');

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        // 権限は初めてお気に入りを追加した時に要求する
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestSoundPermission: false,
          requestBadgePermission: false,
        ),
      ),
      onDidReceiveNotificationResponse: (response) =>
          tappedStationId.value = response.payload,
    );

    // 通知のタップでアプリが起動した場合
    final launchDetails = await _plugin.getNotificationAppLaunchDetails();
    if (launchDetails?.didNotificationLaunchApp ?? false) {
      tappedStationId.value = launchDetails?.notificationResponse?.payload;
    }
  }

  static Future<void> requestPermission() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, sound: true);
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  /// 通知する放送回を開始時刻の近い順に返す
  /// 帯番組の複数の枠が続けて放送される場合は、最初の枠だけを通知する
  @visibleForTesting
  static Iterable<SearchProgram> notificationTargets(
    List<SearchProgram> programs,
  ) sync* {
    final now = DateTime.now();
    // 番組シリーズごとの、直前の枠の終了時刻
    final lastEndTimes = <String, DateTime>{};
    for (final program in programs.sortedBy((e) => e.startTime)) {
      final key = '${program.stationId}|${seriesTitleOf(program.title)}';
      final isContinued = lastEndTimes[key] == program.startTime;
      lastEndTimes[key] = program.endTime;
      if (isContinued || !program.startTime.isAfter(now)) {
        continue;
      }
      yield program;
    }
  }

  /// 予約済みの通知を全て取り消し、渡された番組の放送開始時刻に通知を予約し直す
  static Future<void> reschedule(List<SearchProgram> programs) async {
    try {
      await _reschedule(programs);
    } on PlatformException catch (e) {
      // 通知が許可されていない場合など
      log.warning('failed to schedule program notifications: $e');
    }
  }

  static Future<void> _reschedule(List<SearchProgram> programs) async {
    await _plugin.cancelAllPendingNotifications();
    final targets = notificationTargets(programs).take(_maxScheduledCount);
    for (final program in targets) {
      await _plugin.zonedSchedule(
        id: '${program.stationId}${program.startTime}'.hashCode & 0x7fffffff,
        scheduledDate: tz.TZDateTime.from(program.startTime, _location),
        notificationDetails: _details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        title: seriesTitleOf(program.title),
        body: '▶ 放送が始まりました',
        payload: program.stationId,
      );
    }
    log.info('scheduled ${targets.length} program notifications');
  }
}
