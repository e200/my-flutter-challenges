import 'package:animated_mouse_pointer/pulse.dart';
import 'package:flutter/material.dart';

class AnimatedMousePointerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PulsePointerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
