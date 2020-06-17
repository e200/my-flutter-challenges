import 'package:clock/clock/clock_painter.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomPaint(
            size: Size.square(200),
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}
