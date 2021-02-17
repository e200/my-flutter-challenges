import 'package:flutter/material.dart';
import 'package:pulse/pulse.dart';

class PulsePointerPage extends StatefulWidget {
  @override
  _PulsePointerPageState createState() => _PulsePointerPageState();
}

class _PulsePointerPageState extends State<PulsePointerPage> {
  final _colors = [
    Colors.black,
    Colors.white,
  ];

  final _mousePointerPositionNotifier = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (details) {
          _mousePointerPositionNotifier.value = details.localPosition;
        },
        child: Pulse(
          pulseColor: _colors.first,
          duration: Duration(seconds: 1),
          child: ValueListenableBuilder(
            valueListenable: _mousePointerPositionNotifier,
            builder: (context, value, child) {
              return Stack(
                children: [
                  MouseFollower(position: value),
                ],
              );
            },
          ),
          onComplete: () {
            setState(() {
              final _currentColor = _colors.first;

              _colors.remove(_currentColor);
              _colors.add(_currentColor);
            });
          },
        ),
      ),
    );
  }
}

class MouseFollower extends ImplicitlyAnimatedWidget {
  final Offset position;
  final Widget child;

  MouseFollower({
    this.position,
    this.child,
  }) : super(
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );

  @override
  ImplicitlyAnimatedWidgetState createState() => _MouseFollowerState();
}

class _MouseFollowerState extends AnimatedWidgetBaseState<MouseFollower> {
  Tween<Offset> _positionTween;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return CustomPaint(
          size: Size(
            constrains.maxWidth,
            constrains.maxHeight,
          ),
          painter: MouseFollowerPaint(
            radius: 80,
            position: _positionTween.evaluate(animation),
          ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void forEachTween(visitor) {
    _positionTween = visitor(
      _positionTween,
      widget.position,
      (value) => Tween<Offset>(
        begin: value,
      ),
    );
  }
}

class MouseFollowerPaint extends CustomPainter {
  final double radius;
  final Offset position;

  MouseFollowerPaint({
    this.position,
    this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      position,
      radius,
      Paint()
        ..blendMode = BlendMode.difference
        ..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
