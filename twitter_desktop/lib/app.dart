import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_desktop/router.gr.dart';
import 'package:twitter_desktop/theme.dart';

class TwitterDesktopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator<Router>(router: Router()),
      themeMode: ThemeMode.dark,
      theme: getTheme(context, true),
      debugShowCheckedModeBanner: false,
    );
  }
}
