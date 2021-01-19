import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/screens/home/screen.dart';
import 'package:twitter_desktop/ui/theme.dart';

class TwitterDesktopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) {
        return ThemeBloc();
      },
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (BuildContext context, isDark) {
          return MaterialApp(
            themeMode: ThemeMode.dark,
            theme: AppTheme(isDark: isDark).getTheme(context),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
