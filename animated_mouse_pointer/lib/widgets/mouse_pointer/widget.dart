import 'package:flutter/material.dart';

import 'painter.dart';

class MousePointer extends StatelessWidget {
  final double radius;
  final Offset position;

  const MousePointer({
    Key key,
    this.radius,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
          painter: MousePointerPaint(
            radius: radius,
            position: position,
          ),
        );
      },
    );
  }
}
