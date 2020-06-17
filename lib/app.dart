
import 'package:clock/clock/clock.dart';
import 'package:flutter/material.dart';

final Color darkBlue = Color(0xFF242728);

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Clock(),
      ),
    );
  }
}
