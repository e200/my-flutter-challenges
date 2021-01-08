import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MousePointerPaint extends CustomPainter {
  final double radius;
  final Offset position;

  MousePointerPaint({
    this.radius,
    this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      position,
      radius,
      Paint()
        ..color = Colors.white
        ..blendMode = BlendMode.difference,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
