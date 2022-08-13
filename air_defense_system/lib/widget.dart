import 'dart:math';

import 'package:flutter/material.dart';

class AirDefenseSystem extends StatefulWidget {
  const AirDefenseSystem({Key? key}) : super(key: key);

  @override
  State<AirDefenseSystem> createState() => _AirDefenseSystemState();
}

class _AirDefenseSystemState extends State<AirDefenseSystem> with SingleTickerProviderStateMixin {
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

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, snapshot) {
            return Transform.rotate(
              angle: -_animation.value,
              child: CustomPaint(
                size: size,
                painter: AirDefenseSystemBackgroundPainter(),
              ),
            );
          }
        ),
        CustomPaint(
          size: size,
          painter: AirDefenseSystemLinesPainter(),
        ),
      ],
    );
  }
}

class AirDefenseSystemLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const radarColor = Color(0xFF0ef30f);

    final center = Offset(size.width / 2, size.height / 2);

    final firstArcRadius = min(size.width / 2, size.height / 2);
    final secondArcRadius = firstArcRadius / 100 * 90;
    final thirdArcRadius = firstArcRadius / 100 * 70;
    final fourthArcRadius = firstArcRadius / 100 * 40;

    final paint = Paint()
      ..color = radarColor
      ..strokeWidth = 1 / 100 * firstArcRadius
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: firstArcRadius),
      0,
      2 * pi,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: secondArcRadius),
      0,
      2 * pi,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: thirdArcRadius),
      0,
      2 * pi,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: fourthArcRadius),
      0,
      2 * pi,
      false,
      paint,
    );

    final linePaint = Paint()
      ..color = radarColor
      ..strokeWidth = 4 / 100 * firstArcRadius
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < 17; i++) {
      final angle = i * pi / 8;
      final start = Offset(
        center.dx + firstArcRadius * cos(angle),
        center.dy + firstArcRadius * sin(angle),
      );
      final end = Offset(
        center.dx + secondArcRadius * cos(angle),
        center.dy + secondArcRadius * sin(angle),
      );
      canvas.drawLine(start, end, linePaint);
    }

    for (var i = 0; i < 15; i++) {
      final angle = i * pi / 4;
      final x = center.dx + secondArcRadius * cos(angle);
      final y = center.dy + secondArcRadius * sin(angle);

      canvas.drawLine(center, Offset(x, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AirDefenseSystemBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final radialPaint = Paint()
      ..shader = const SweepGradient(
        center: Alignment.center,
        startAngle: 0,
        endAngle: pi * 2,
        colors: [
          Color(0xFF0ef30f),
          Color(0xFF1B641B),
          Color(0xFF255C25),
          Colors.black,
        ],
        stops: [
          0.1,
          0.25,
          0.5,
          0.8,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius / 100 * 90, radialPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
