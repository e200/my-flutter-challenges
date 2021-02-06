import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final scaffoldBackgroundColor = Color(0xFF0F141D);

ThemeData getTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: GoogleFonts.sourceSansProTextTheme().copyWith(
      headline1: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 36.0,
      ),
      bodyText2: TextStyle(
        color: Color(0xFFC4C1C2),
        fontSize: 14.0,
      ),
    ),
  );
}