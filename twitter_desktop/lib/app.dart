import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/router.gr.dart';
import 'package:twitter_desktop/ui/theme/theme.dart';

class TwitterDesktopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) {
        return ThemeBloc();
      },
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (BuildContext context, isDark) {
          return Builder(builder: (context) {
            return MaterialApp(
              builder: ExtendedNavigator<Router>(router: Router()),
              themeMode: ThemeMode.dark,
              theme: ThemeProvider(isDark: isDark).getTheme(context),
              debugShowCheckedModeBanner: false,
            );
          });
        },
      ),
    );
  }
}
