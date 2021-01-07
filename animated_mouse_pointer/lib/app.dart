import 'package:animated_mouse_pointer/screens/home.dart';
import 'package:flutter/material.dart';

class AnimatedMousePointerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
