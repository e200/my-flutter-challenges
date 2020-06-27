import 'package:facebook_desktop/screens/home/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FacebookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
