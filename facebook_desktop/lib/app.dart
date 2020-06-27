import 'package:facebook_desktop/screens/home/screen.dart';
import 'package:facebook_desktop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FacebookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(context),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
