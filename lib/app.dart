
import 'package:clock/clock/clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF242728)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Clock(),
      ),
    );
  }
}
