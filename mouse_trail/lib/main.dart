import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MouseTrailApp());
}

class MouseTrailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/canvas.jpg',
            fit: BoxFit.cover,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black,
              BlendMode.srcOut,
            ),
            child: MouseTrails(),
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MouseTrails extends StatefulWidget {
  @override
  _MouseTrailsState createState() => _MouseTrailsState();
}

class _MouseTrailsState extends State<MouseTrails> {
  final _random = Random();

  final _mouseTrails = <MouseTrail>[];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return MouseRegion(
      onHover: (details) {
        setState(() {
          final _key = UniqueKey();

          _mouseTrails.add(
            MouseTrail(
              key: _key,
              size: _size,
              random: _random,
              center: details.localPosition,
              onCompleteAnimation: (owner) {
                _mouseTrails.remove(owner);

                setState(() {
                  _mouseTrails.removeWhere((element) => element.key == _key);
                });
              },
            ),
          );
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: SourceBackgroundPainter(),
          ),
          ..._mouseTrails,
        ],
      ),
    );
  }
}

class SourceBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.largest,
      Paint()
        ..colorFilter = ColorFilter.mode(
          Colors.black,
          BlendMode.dstOut,
        ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MouseTrail extends StatefulWidget {
  final Offset center;
  final Random random;
  final Size size;
  final Function(Widget owner) onCompleteAnimation;

  const MouseTrail({
    Key key,
    this.center,
    this.size,
    this.random,
    this.onCompleteAnimation,
  }) : super(key: key);

  @override
  _MouseTrailState createState() => _MouseTrailState();
}

class _MouseTrailState extends State<MouseTrail>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _animation;

  final _mouseTrailRadius = 50.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    if (widget.onCompleteAnimation != null) {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onCompleteAnimation(widget);
        }
      });
    }

    final _random = widget.random;

    final _size = widget.size;

    final _x = (_size.width * _random.nextDouble()) + _mouseTrailRadius;
    final _y = (_size.height * _random.nextDouble()) + _mouseTrailRadius;

    _animation = Tween<Offset>(
      begin: widget.center,
      end: Offset(_x, _y),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: MouseTrailPainter(
        radius: _mouseTrailRadius,
        center: _animation.value,
      ),
    );
  }
}

