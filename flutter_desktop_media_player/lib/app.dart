import 'package:flutter/material.dart';
import 'package:flutter_desktop_media_player/components/player/player.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterDesktopMediaPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Desktop Media Player',
      theme: ThemeData(
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
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF0F141D),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Sidebar(),
              Player(),
            ],
          );
        }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
