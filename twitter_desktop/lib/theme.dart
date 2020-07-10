import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context, bool isDark) {
  final _primaryColor = Color(0xFF1da1f2);

  final _scaffoldDarkBackgroundColor = Color(0xFF262D37);

  final _scaffoldWhiteBackgroundColor = Colors.white;
  final _componentsDarkBackgroundColor = Color(0xFF3c424B);

  final _theme = ThemeData(
    scaffoldBackgroundColor: _scaffoldWhiteBackgroundColor,
    primaryColor: _primaryColor,
  );

  if (isDark) {
    return _theme.copyWith(
      scaffoldBackgroundColor: _scaffoldDarkBackgroundColor,
    );
  }

  return _theme;
}
