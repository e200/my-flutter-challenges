import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.sourceSansProTextTheme().copyWith(
      headline1: TextStyle(
        // fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 16,
        color: Color(0xFF86848C),
      ),
      bodyText2: TextStyle(
          // fontSize: 14,
          ),
    ),
  );
}
