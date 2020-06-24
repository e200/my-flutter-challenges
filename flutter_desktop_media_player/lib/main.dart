import 'package:flutter/material.dart';

void main() {
  runApp(FlutterDesktopMediaPlayerApp());
}

class FlutterDesktopMediaPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Desktop Media Player',
      home: Scaffold(
        backgroundColor: Color(0xFF050507),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
