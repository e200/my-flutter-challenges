import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  Paint _innerCircle;
  Paint _outerCircle;
  Paint _hoursLine;
  Paint _minutesLine;
  Paint _secondsLine;

  ClockPainter() {
    _innerCircle = Paint()
      ..color = Color(0xFF292929)
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    _outerCircle = Paint()
      ..color = Colors.white
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    _secondsLine = Paint()
      ..color = Color(0xFFA33535)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _minutesLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _hoursLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final _centerX = size.width / 2;
    final _centerY = size.height / 2;
    final _center = Offset(_centerX, _centerY);
    final _radius = min(_centerX, _centerY);

    canvas.drawArc(
      Rect.fromCenter(
        center: _center,
        width: size.width,
        height: size.height,
      ),
      0,
      pi * 2,
      false,
      _outerCircle,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: _center,
        width: size.width,
        height: size.height,
      ),
      0,
      pi * 2,
      false,
      _innerCircle,
    );

    canvas.drawLine(
      Offset(
        0,
        0,
      ),
      Offset(0, 0),
      _hoursLine,
    );

    canvas.drawLine(
      Offset(
        0,
        0,
      ),
      Offset(_centerX, _centerY),
      _minutesLine,
    );

    canvas.drawLine(
      Offset(
        0,
        0,
      ),
      Offset(_centerX, _centerY),
      _secondsLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
