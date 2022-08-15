import 'dart:math';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AirDefenseSystem extends StatelessWidget {
  final double radarRange;
  final double enemySize;

  final _targetsPositions = <Offset>[];
  final _targetsToAngage = <Offset>[];

  AirDefenseSystem({
    super.key,
    required this.radarRange,
    required this.enemySize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      margin: const EdgeInsets.all(15),
      child: LayoutBuilder(builder: (context, constraint) {
        return AirDefenseRadar(
          radarRange: radarRange,
          enemySize: enemySize,
          targetsToEngage: _targetsToAngage,
          onScanUpdated: (radarAngle) {
            final areaSize = Size(constraint.maxWidth, constraint.maxHeight);

            _findAndEngageTarget(radarAngle, radarRange, areaSize);
          },
          onTargetAdd: (targetPosition) {
            _targetsPositions.add(targetPosition);
          },
          onTargetOutOfRange: (target) async {
            // _targetsToAngage.remove(target);
          },
        );
      }),
    );
  }

  _findAndEngageTarget(
      double radarAngle, double radarRangeAreaPercentage, Size areaSize) async {
    final center = areaSize.center(Offset.zero);

    final radarRange = (pi * 2) / 100 * radarRangeAreaPercentage;

    for (var i = 0; i < _targetsPositions.length; i++) {
      final target = _targetsPositions[i];
      final targetAngle = getTargetAngle(center, target);

      if (isTargetInRadarRange(radarAngle, targetAngle, radarRange)) {
        if (!_targetsToAngage.contains(target)) {
          _targetsToAngage.add(target);

          playTargetEngagedSound();
          // _targetsPositions.remove(target);
        }
      }
    }
  }

  void playTargetEngagedSound() {
    AssetsAudioPlayer.newPlayer().open(
      Audio('assets/sonar-ping-sound-effect.mp3'),
      autoStart: true,
    );
  }

  bool isTargetInRadarRange(
      double radarAngle, double targetAngle, double radarRange) {
    return radarAngle >= targetAngle &&
        radarAngle <= (targetAngle + radarRange);
  }

  double getTargetAngle(Offset center, Offset targetPosition) {
    final atan2Angle = atan2(
      center.dx - targetPosition.dx,
      center.dy - targetPosition.dy,
    );

    double angle;

    if (atan2Angle < 0) {
      angle = atan2Angle + pi * 2;
    } else {
      angle = atan2Angle;
    }

    return (pi * 2) - angle;
  }
}

class AirDefenseRadar extends StatefulWidget {
  final double radarRange;
  final double enemySize;
  final Function(double angle) onScanUpdated;
  final Function(Offset targetLocalPosition) onTargetAdd;
  final Function(Offset target) onTargetOutOfRange;
  final List<Offset> targetsToEngage;

  const AirDefenseRadar({
    Key? key,
    required this.radarRange,
    required this.enemySize,
    required this.onScanUpdated,
    required this.onTargetAdd,
    required this.onTargetOutOfRange,
    this.targetsToEngage = const [],
  }) : super(key: key);

  @override
  State<AirDefenseRadar> createState() => _AirDefenseRadarState();
}

class _AirDefenseRadarState extends State<AirDefenseRadar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });

    _animation.addListener(() {
      widget.onScanUpdated(_animation.value);
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Stack(
              children: [
                Transform.rotate(
                  angle: _animation.value - (pi / 2),
                  child: CustomPaint(
                    size: size,
                    painter: AirDefenseRadarBackgroundPainter(
                      radarRange: widget.radarRange,
                    ),
                  ),
                ),
                ...widget.targetsToEngage.map(
                  (target) {
                    final enemyRadius = widget.enemySize / 2;

                    return Positioned(
                      left: target.dx - enemyRadius,
                      top: target.dy - enemyRadius,
                      child: EnemyTarget(
                        size: widget.enemySize,
                        onOutOfRange: () {
                          widget.onTargetOutOfRange(target);
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
        CustomPaint(
          size: size,
          painter: AirDefenseRadarLinesPainter(),
        ),
        GestureDetector(
          onTapDown: (details) {
            widget.onTargetAdd(details.localPosition);
          },
        ),
      ],
    );
  }
}

class AirDefenseRadarLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const radarColor = Color(0xFF0ef30f);
    final radarLinesColor = radarColor.withOpacity(.2);

    final center = size.center(Offset.zero);

    final firstArcRadius = min(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = radarLinesColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 5; i++) {
      drawArc(canvas, center, firstArcRadius / 100 * (i * 18), paint);
    }

    final linePaint = Paint()
      ..color = radarLinesColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const outterLinesCount = 120;
    const distanceFromOuterCircle = 15;

    for (var i = 0; i < outterLinesCount; i++) {
      final angle = i * pi / (outterLinesCount / 2);
      final start = Offset(
        center.dx + firstArcRadius * cos(angle),
        center.dy + firstArcRadius * sin(angle),
      );
      final end = Offset(
        center.dx + (firstArcRadius + distanceFromOuterCircle) * cos(angle),
        center.dy + (firstArcRadius + distanceFromOuterCircle) * sin(angle),
      );

      canvas.drawLine(start, end, linePaint);
    }

    const crossLinesCount = 4;

    for (var i = 0; i < crossLinesCount; i++) {
      final angle = i * pi / (crossLinesCount / 2);

      final x = center.dx + firstArcRadius * cos(angle);
      final y = center.dy + firstArcRadius * sin(angle);

      canvas.drawLine(center, Offset(x, y), paint);
    }
  }

  void drawArc(
    Canvas canvas,
    Offset center,
    double firstArcRadius,
    Paint paint,
  ) {
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: firstArcRadius),
      0,
      2 * pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AirDefenseRadarBackgroundPainter extends CustomPainter {
  final double radarRange;

  const AirDefenseRadarBackgroundPainter({
    required this.radarRange,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final radialPaint = Paint()
      ..shader = SweepGradient(
        center: Alignment.center,
        startAngle: 0,
        endAngle: pi * 2,
        colors: const [
          Colors.black,
          Color(0xFF255C25),
          Color(0xFF0ef30f),
        ],
        stops: [
          0,
          1 - (radarRange / 100),
          1,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius / 100 * 90, radialPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class EnemyTarget extends StatefulWidget {
  final double size;
  final VoidCallback onOutOfRange;

  const EnemyTarget({
    Key? key,
    required this.size,
    required this.onOutOfRange,
  }) : super(key: key);

  @override
  State<EnemyTarget> createState() => _EnemyTargetState();
}

class _EnemyTargetState extends State<EnemyTarget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onOutOfRange();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Opacity(
          opacity: 1 - _animation.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                stops: const [
                  0,
                  0.3,
                  .5,
                ],
                colors: [
                  const Color(0xFF35E23B),
                  Colors.green.withOpacity(.2),
                  Colors.green.withOpacity(0),
                ],
              ),
            ),
            width: widget.size,
            height: widget.size,
          ),
        );
      },
    );
  }
}
