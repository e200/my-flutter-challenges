import 'package:animated_mouse_pointer/screens/home.dart';
import 'package:flutter/material.dart';

class AnimatedMousePointerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
