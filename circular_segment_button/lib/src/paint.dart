import 'package:flutter/widgets.dart';

class CircularSegmentPaint extends CustomPainter {
  final int segmentsCount = 4;

  Paint _segmentPaint;

  CircularSegmentPaint() {
    _segmentPaint = Paint()
    ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final _centerX = size.width / 2;
    final _centerY = size.width / 2;
    final _center = Offset(_centerX, _centerY);

    for (int i = 0; i < segmentsCount; i++) {
      canvas.drawArc(
        Rect.fromCenter(
          center: _center,
          width: size.width,
          height: size.height,
        ),
        0,
        0,
        false,
        _segmentPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
