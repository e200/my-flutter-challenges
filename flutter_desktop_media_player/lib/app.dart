import 'package:flutter/material.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterDesktopMediaPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Desktop Media Player',
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSansProTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF0F141D),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Sidebar(),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            /* Container(
              padding: EdgeInsets.all(30),
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ) */
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
