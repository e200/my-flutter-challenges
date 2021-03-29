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

