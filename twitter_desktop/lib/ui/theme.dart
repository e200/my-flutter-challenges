import 'package:flutter/material.dart';

class ThemeProvider {
  final bool isDark;

  ThemeProvider({
    this.isDark = false,
  });

  ThemeData getTheme(BuildContext context) {
    final _primaryColor = Color(0xFF1DA1F2);
    final _scaffold = _c(0xFF262D37, 0xFFFFFFFF);
    final _background = _c(0xFF303841, 0xFFF2F2F2);
    final _icon = _c(0xFF656972);

    final _theme = ThemeData(
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _scaffold,
      backgroundColor: _background,
      iconTheme: IconThemeData(
        color: _icon,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
      ),
    );

    if (isDark) {
      return _theme.copyWith(
        textTheme: TextTheme(),
      );
    }

    return _theme;
  }

  Color _c(int darkHex, [int lightHex]) {
    return Color(isDark ? darkHex : lightHex ?? darkHex);
  }
}
