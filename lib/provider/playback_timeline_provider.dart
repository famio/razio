import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:razio/const.dart';
import 'package:razio/entity/program.dart';
import 'package:razio/entity/search.dart';
import 'package:razio/provider/audio_player_provider.dart';
import 'package:razio/provider/auth_provider.dart';
import 'package:razio/provider/now_on_air_program_list.dart';
import 'package:razio/util.dart';

/// 放送中の番組がタイムフリーで配信されるまでの遅れ
/// 実測では約1分45秒で、それより新しい時刻を指定するとサーバー側で丸められる
/// それより新しい位置へのシークはLive放送を遡って再生する
const timefreeDelay = Duration(minutes: 2);

/// Live放送の配信の遅れ(実測値)
/// Live放送の再生開始位置は 現在時刻 - この値 - windowSeconds になる
const _liveStreamLatency = Duration(seconds: 17);

/// Live放送を遡って再生できる秒数の範囲
const _minLiveWindowSeconds = 15;
const _maxLiveWindowSeconds = 300;

/// 再生中の番組の時間軸
class PlaybackTimeline {
  const PlaybackTimeline({
    required this.stationId,
    required this.start,
    required this.end,
    required this.isLiveProgram,
    required this.isLiveStream,
    required this.anchor,
    required this.mediaItem,
  });

  final String stationId;
  final DateTime start;
  final DateTime end;

  /// 放送中の番組かどうか
  final bool isLiveProgram;

  /// 再生中のAudioSourceがLive放送の配信かどうか
  /// falseの場合はタイムフリーの配信
  final bool isLiveStream;

  /// 現在のAudioSourceの再生開始地点の放送時刻
  /// nullの場合はLive放送(最新)を再生中
  final DateTime? anchor;

  final MediaItem mediaItem;

  bool get isAtLiveEdge => anchor == null;
}

final playbackTimelineProvider =
    StateNotifierProvider<PlaybackTimelineNotifier, PlaybackTimeline?>((ref) {
  final notifier = PlaybackTimelineNotifier(ref);
  // Live放送の番組が切り替わったらタイムラインも更新する
  ref.listen<AsyncValue<List<Program>>>(
    nowOnAirProgramListProvider,
    (previous, next) => next.whenData(notifier._onNowOnAirProgramListChanged),
  );
  return notifier;
});

PlaybackTimeline _liveTimeline(Program program, {required DateTime? anchor}) {
  return PlaybackTimeline(
    stationId: program.stationId,
    start: program.startDate,
    end: program.endDate,
    isLiveProgram: true,
    isLiveStream: true,
    anchor: anchor,
    mediaItem: MediaItem(
      id: program.title + program.startTime,
      artist: program.stationName,
      title: program.title,
      artUri: Uri.parse(program.img),
    ),
  );
}

class PlaybackTimelineNotifier extends StateNotifier<PlaybackTimeline?> {
  PlaybackTimelineNotifier(this._ref) : super(null) {
    _playerStateSubscription = audioPlayer.playerStateStream.listen((event) {
      if (event.playing && event.processingState == ProcessingState.ready) {
        _stopwatch.start();
      } else {
        _stopwatch.stop();
      }
      if (event.processingState == ProcessingState.completed) {
        _onCompleted();
      }
    });
  }

  final Ref _ref;

  /// Live放送を遡って再生中に、再生位置が番組の終わりに達した時に次の番組へ切り替えるタイマー
  Timer? _programSwitchTimer;

  /// anchorからの再生経過時間
  /// Radikoのタイムフリーはサーバー側で再生位置が進むスライディングウィンドウ形式のため、
  /// プレイヤーのpositionではなく実際に再生していた時間から位置を算出する
  final _stopwatch = Stopwatch();
  late final StreamSubscription<PlayerState> _playerStateSubscription;

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _programSwitchTimer?.cancel();
    super.dispose();
  }

  /// 現在の再生位置(放送時刻)
  DateTime? get position {
    final timeline = state;
    if (timeline == null) {
      return null;
    }
    final anchor = timeline.anchor;
    if (anchor == null) {
      return DateTime.now();
    }
    final position = anchor.add(_stopwatch.elapsed);
    return position.isAfter(timeline.end) ? timeline.end : position;
  }

  /// Live放送を再生する
  /// windowSecondsを指定した場合は、その秒数だけ遡った位置から再生する
  Future<void> loadLive(
    String stationId, {
    int windowSeconds = _minLiveWindowSeconds,
  }) async {
    final audioSource = await _ref.read(
      audioSourceFromStationIdProvider(
        (stationId: stationId, windowSeconds: windowSeconds),
      ).future,
    );
    final programs = await _ref.read(nowOnAirProgramListProvider.future);
    final program =
        programs.firstWhere((element) => element.stationId == stationId);
    final anchor = windowSeconds > _minLiveWindowSeconds
        ? DateTime.now()
            .subtract(_liveStreamLatency)
            .subtract(Duration(seconds: windowSeconds))
        : null;
    _setTimeline(_liveTimeline(program, anchor: anchor));
    await audioPlayer.setAudioSource(audioSource);
  }

  /// タイムフリーの番組を再生する
  Future<void> loadSearchProgram(SearchProgram program) async {
    final timeline = PlaybackTimeline(
      stationId: program.stationId,
      start: program.startTime,
      end: program.endTime,
      isLiveProgram: false,
      isLiveStream: false,
      anchor: program.startTime,
      mediaItem: MediaItem(
        id: program.title + program.startTime.toString(),
        artist: DateFormat.yMEd('ja').format(program.startTime),
        title: program.title,
        artUri: program.img,
      ),
    );
    await _loadTimefree(timeline);
  }

  /// 指定した放送時刻にシークする
  /// 放送中の番組で、タイムフリーでまだ配信されていない直近の位置はLive放送を遡って再生する
  Future<void> seek(DateTime target) async {
    final timeline = state;
    if (timeline == null) {
      return;
    }
    final now = DateTime.now();
    if (timeline.isLiveProgram && target.isAfter(now.subtract(timefreeDelay))) {
      final behind = now.difference(target) - _liveStreamLatency;
      // 配信は5秒単位のセグメントのため5秒単位に丸める
      final windowSeconds = ((behind.inSeconds / 5).round() * 5)
          .clamp(_minLiveWindowSeconds, _maxLiveWindowSeconds);
      await loadLive(timeline.stationId, windowSeconds: windowSeconds);
      return;
    }
    final clamped = target.isBefore(timeline.start) ? timeline.start : target;
    await _loadTimefree(
      PlaybackTimeline(
        stationId: timeline.stationId,
        start: timeline.start,
        end: timeline.end,
        isLiveProgram: timeline.isLiveProgram,
        isLiveStream: false,
        anchor: clamped,
        mediaItem: timeline.mediaItem,
      ),
    );
  }

  /// Live放送(最新位置)に戻す
  Future<void> seekToLive() async {
    final timeline = state;
    if (timeline == null || !timeline.isLiveProgram) {
      return;
    }
    await loadLive(timeline.stationId);
  }

  /// 一時停止から再開する
  Future<void> resume() async {
    final timeline = state;
    final position = this.position;
    if (timeline == null || timeline.isAtLiveEdge || position == null) {
      await audioPlayer.play();
      return;
    }
    // 一時停止中もサーバー側の再生位置は進んでしまうため、停止した位置から読み込み直す
    // 番組の最後まで再生済みの場合は最初から再生する
    final isFinished = !position.isBefore(
      timeline.end.subtract(const Duration(seconds: 5)),
    );
    await seek(isFinished ? timeline.start : position);
    await audioPlayer.play();
  }

  void _onNowOnAirProgramListChanged(List<Program> programs) {
    final timeline = state;
    if (timeline == null || !timeline.isLiveStream) {
      return;
    }
    final program = programs
        .firstWhereOrNull((element) => element.stationId == timeline.stationId);
    if (program == null || program.startDate == timeline.start) {
      return;
    }
    _programSwitchTimer?.cancel();
    // Live放送を遡って再生中の場合は、再生位置が次の番組に達するまで待ってから切り替える
    final remaining = timeline.isAtLiveEdge
        ? Duration.zero
        : timeline.end.difference(timeline.anchor!.add(_stopwatch.elapsed));
    if (remaining > Duration.zero) {
      _programSwitchTimer = Timer(
        remaining,
        () => _onNowOnAirProgramListChanged(programs),
      );
      return;
    }
    // 配信はそのまま続いているので、再生位置(anchor)を引き継いで番組だけ切り替える
    state = _liveTimeline(program, anchor: timeline.anchor);
  }

  void _setTimeline(PlaybackTimeline timeline) {
    _programSwitchTimer?.cancel();
    _stopwatch.reset();
    state = timeline;
  }

  Future<void> _loadTimefree(PlaybackTimeline timeline) async {
    final authInfo = _ref.read(authProvider).value;
    if (authInfo == null) {
      throw Exception('authInfo is null');
    }
    final header = <String, String>{
      HeaderKey.authtoken.value: authInfo.authToken,
    };
    final outputFormat = DateFormat('yyyyMMddHHmmss');
    final startAt = outputFormat.format(timeline.start);
    final endAt = outputFormat.format(timeline.end);
    final url = Uri.https(
      'tf-f-rpaa-radiko.smartstream.ne.jp',
      '/tf/playlist.m3u8',
      <String, dynamic>{
        'station_id': timeline.stationId,
        'start_at': startAt,
        'ft': startAt,
        'end_at': endAt,
        'to': endAt,
        if (timeline.anchor != null)
          'seek': outputFormat.format(timeline.anchor!),
        'l': '15',
        'lsid': generateUid(),
        'type': 'b',
      },
    );
    _setTimeline(timeline);
    await audioPlayer.setAudioSource(
      AudioSource.uri(url, headers: header, tag: timeline.mediaItem),
    );
  }

  void _onCompleted() {
    final timeline = state;
    if (timeline == null || timeline.isAtLiveEdge) {
      return;
    }
    // 追っかけ再生で番組の最後まで到達したらLive放送に戻す
    if (timeline.isLiveProgram) {
      unawaited(loadLive(timeline.stationId));
    }
  }
}
