part of 'main_page.dart';

/// リストと再生ボタンの間の区切り線を兼ねたシークバー
class _BottomDivider extends HookConsumerWidget {
  const _BottomDivider();

  static const height = 24.0;
  static const _horizontalMargin = 16.0;

  /// Live放送の位置(現在時刻)からこの距離以内までドラッグしたらLive放送に戻す
  /// 手前で微調整できるよう、つまみの大きさよりも小さくしている
  static const _liveSnapDistance = 4.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeline = ref.watch(playbackTimelineProvider);
    final notifier = ref.watch(playbackTimelineProvider.notifier);

    // ドラッグ中の位置(0.0〜1.0)
    final dragFraction = useState<double?>(null);
    // シーク後、新しい位置での再生が始まるまで表示し続ける位置
    final pendingFraction = useState<double?>(null);
    final isDragging = dragFraction.value != null;
    final dragAnimation = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    // 再生位置の表示を更新する
    final now = useState(DateTime.now());
    useEffect(
      () {
        final timer = Timer.periodic(
          const Duration(milliseconds: 500),
          (_) => now.value = DateTime.now(),
        );
        return timer.cancel;
      },
      const <Object?>[],
    );
    useEffect(
      () {
        pendingFraction.value = null;
        return null;
      },
      [timeline],
    );

    if (timeline == null) {
      return const SizedBox(
        height: height,
        child: _SeekBarTrack(played: 0, available: 0, thumbScale: 0),
      );
    }

    final duration = timeline.end.difference(timeline.start);
    double fractionOf(DateTime time) {
      if (duration <= Duration.zero) {
        return 0;
      }
      final fraction = time.difference(timeline.start).inMilliseconds /
          duration.inMilliseconds;
      return fraction.clamp(0.0, 1.0);
    }

    final position = notifier.position ?? timeline.start;
    // 再生可能な範囲の右端。放送中の番組では現在時刻
    final availableFraction =
        timeline.isLiveProgram ? fractionOf(now.value) : 1.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth - _horizontalMargin * 2;
        double fractionFromDx(double dx) {
          if (trackWidth <= 0) {
            return 0;
          }
          return ((dx - _horizontalMargin) / trackWidth).clamp(0.0, 1.0);
        }

        bool isLiveZone(double fraction) {
          if (!timeline.isLiveProgram || trackWidth <= 0) {
            return false;
          }
          return fraction >= availableFraction - _liveSnapDistance / trackWidth;
        }

        final drag = dragFraction.value;
        final isDraggingToLive = drag != null && isLiveZone(drag);
        final displayFraction = drag == null
            ? pendingFraction.value ?? fractionOf(position)
            : isDraggingToLive
                ? availableFraction
                : min(drag, availableFraction);

        void onDragStart(DragStartDetails details) {
          HapticFeedback.selectionClick();
          dragAnimation.forward();
          dragFraction.value =
              fractionFromDx(details.localPosition.dx).clamp(0.0, 1.0);
        }

        void onDragUpdate(DragUpdateDetails details) {
          final next = fractionFromDx(details.localPosition.dx);
          final previous = dragFraction.value;
          if (previous != null && isLiveZone(previous) != isLiveZone(next)) {
            HapticFeedback.selectionClick();
          }
          dragFraction.value = next;
        }

        void onDragEnd() {
          final fraction = dragFraction.value;
          dragAnimation.reverse();
          dragFraction.value = null;
          if (fraction == null) {
            return;
          }
          final action = ref.read(mainPageActionProvider.notifier);
          if (isLiveZone(fraction)) {
            pendingFraction.value = availableFraction;
            unawaited(action.onSeekToLive());
          } else {
            final clamped = min(fraction, availableFraction);
            pendingFraction.value = clamped;
            unawaited(action.onSeek(timeline.start.add(duration * clamped)));
          }
        }

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragStart: onDragStart,
          onHorizontalDragUpdate: onDragUpdate,
          onHorizontalDragEnd: (_) => onDragEnd(),
          onHorizontalDragCancel: onDragEnd,
          child: SizedBox(
            height: height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: dragAnimation,
                    builder: (context, _) {
                      final t = Curves.easeOut.transform(dragAnimation.value);
                      return _SeekBarTrack(
                        played: displayFraction,
                        available: availableFraction,
                        thumbScale: t,
                      );
                    },
                  ),
                ),
                if (isDragging)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: height,
                    child: Align(
                      // 画面端でもはみ出さないよう、つまみの位置に合わせて寄せる
                      alignment: Alignment(
                        ((_horizontalMargin + trackWidth * displayFraction) /
                                    constraints.maxWidth) *
                                2 -
                            1,
                        0,
                      ),
                      child: _SeekLabel(
                        text: isDraggingToLive
                            ? 'LIVE'
                            : _seekLabelText(
                                timeline: timeline,
                                target: timeline.start.add(
                                  duration * displayFraction,
                                ),
                              ),
                        isLive: isDraggingToLive,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String _seekLabelText({
  required PlaybackTimeline timeline,
  required DateTime target,
}) {
  if (timeline.isLiveProgram) {
    return DateFormat.Hms().format(target);
  }
  final elapsed = target.difference(timeline.start);
  final total = timeline.end.difference(timeline.start);
  return '${_formatDuration(elapsed)} / ${_formatDuration(total)}';
}

String _formatDuration(Duration duration) {
  final d = duration.isNegative ? Duration.zero : duration;
  final hours = d.inHours;
  final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
}

class _SeekBarTrack extends StatelessWidget {
  const _SeekBarTrack({
    required this.played,
    required this.available,
    required this.thumbScale,
  });

  /// 再生位置(0.0〜1.0)
  final double played;

  /// 再生可能な範囲(0.0〜1.0)
  final double available;

  /// ドラッグ中の強調度合い(0.0〜1.0)
  final double thumbScale;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SeekBarPainter(
        played: played,
        available: available,
        thumbScale: thumbScale,
        trackColor: AppColor.divider(context),
        availableColor: AppColor.icon(context).withValues(alpha: 0.18),
        playedColor: AppColor.accent,
        horizontalMargin: _BottomDivider._horizontalMargin,
      ),
    );
  }
}

class _SeekBarPainter extends CustomPainter {
  _SeekBarPainter({
    required this.played,
    required this.available,
    required this.thumbScale,
    required this.trackColor,
    required this.availableColor,
    required this.playedColor,
    required this.horizontalMargin,
  });

  final double played;
  final double available;
  final double thumbScale;
  final Color trackColor;
  final Color availableColor;
  final Color playedColor;
  final double horizontalMargin;

  static const _trackHeight = 2.0;
  static const _draggingTrackHeight = 4.0;
  static const _thumbRadius = 7.0;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width - horizontalMargin * 2;
    if (width <= 0) {
      return;
    }
    final trackHeight =
        _trackHeight + (_draggingTrackHeight - _trackHeight) * thumbScale;
    final centerY = size.height / 2;
    final radius = Radius.circular(trackHeight / 2);

    void drawBar(double fraction, Color color) {
      if (fraction <= 0) {
        return;
      }
      canvas.drawRRect(
        RRect.fromLTRBR(
          horizontalMargin,
          centerY - trackHeight / 2,
          horizontalMargin + width * fraction,
          centerY + trackHeight / 2,
          radius,
        ),
        Paint()..color = color,
      );
    }

    drawBar(1, trackColor);
    drawBar(available, availableColor);
    drawBar(played, playedColor);

    if (thumbScale > 0) {
      canvas.drawCircle(
        Offset(horizontalMargin + width * played, centerY),
        _thumbRadius * thumbScale,
        Paint()..color = playedColor,
      );
    }
  }

  @override
  bool shouldRepaint(_SeekBarPainter oldDelegate) {
    return played != oldDelegate.played ||
        available != oldDelegate.available ||
        thumbScale != oldDelegate.thumbScale ||
        trackColor != oldDelegate.trackColor ||
        availableColor != oldDelegate.availableColor ||
        playedColor != oldDelegate.playedColor;
  }
}

class _SeekLabel extends StatelessWidget {
  const _SeekLabel({required this.text, required this.isLive});

  final String text;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(12));
    // 裏のリストが透けて見えるすりガラスにする
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isLive
                ? AppColor.accent.withValues(alpha: 0.8)
                : AppColor.frost(context).withValues(alpha: 0.6),
            borderRadius: borderRadius,
          ),
          child: Text(
            text,
            style: AppTextStyle.bodySmall(context).bold.copyWith(
              color: isLive ? Colors.white : null,
              // 数字の幅が変わってシーク中にラベルががたつかないよう等幅フォントにする
              // iOSはMenlo、Androidはmonospaceが使われる
              fontFamily: 'Menlo',
              fontFamilyFallback: const ['monospace'],
            ),
          ),
        ),
      ),
    );
  }
}
