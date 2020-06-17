import 'dart:async';

import 'package:clock/clock/clock_painter.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: -(ClockPainter.oneDegreeInRadian * 90),
          child: CustomPaint(
            willChange: true,
            size: Size.square(180),
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }
}
