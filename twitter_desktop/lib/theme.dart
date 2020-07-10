import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context, bool isDark) {
  final _primaryColor = Color(0xFF1da1f2);

  // final _scaffoldWhiteBackgroundColor = Colors.white;
  // final _componentsDarkBackgroundColor = Color(0xFF303741);

  final _theme = Theme.of(context).copyWith(
    primaryColor: _primaryColor,
    iconTheme: IconThemeData(
      color: Color(0xFF656972),
    ),
  );

  if (isDark) {
    return _theme.copyWith(
      scaffoldBackgroundColor: Color(0xFF262D37),
      textTheme: TextTheme()
    );
  }

  return _theme;
}
