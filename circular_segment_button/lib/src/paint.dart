import 'dart:math';

import 'package:circular_segment_button/circular_segment_button.dart';
import 'package:flutter/widgets.dart';

class CircularSegmentPaint extends CustomPainter {
  final double startAngle;
  final List<Segment> segments;

  CircularSegmentPaint({
    this.startAngle,
    this.segments,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final _centerX = size.width / 2;
    final _centerY = size.width / 2;
    final _center = Offset(_centerX, _centerY);

    final _startAngle = startAngle ?? -(pi / 2);

    for (int i = 0; i < segments.length; i++) {
      final _segment = segments[i];

      final _segmentPaint = Paint()
        ..strokeCap = StrokeCap.round
        ..color = _segment.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = _segment.strokeWidth ?? 10;

      final _segmentRadian = (pi * 2) / segments.length;

      canvas.drawArc(
        Rect.fromCenter(
          center: _center,
          width: size.width,
          height: size.height,
        ),
        _startAngle,
        _segmentRadian * (i + 1),
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
