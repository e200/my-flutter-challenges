import 'package:flutter/material.dart';

import 'painter.dart';

class MousePointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MousePointerPaint(),
    );
  }
}
