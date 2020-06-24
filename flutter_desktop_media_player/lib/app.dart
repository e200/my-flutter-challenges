import 'package:flutter/material.dart';
import 'package:flutter_desktop_media_player/components/playlist/widget.dart';
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
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Sidebar(),
                    Expanded(
                      child: Playlist()
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.skip_previous,
                                  color: Color(0xFF303846),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1F2631),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.pause,
                                  size: 28,
                                  color: Color(0xFFC4C1C2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.skip_next,
                                  color: Color(0xFF303846),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.shuffle,
                                  color: Color(0xFF303846),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.repeat,
                                  color: Color(0xFF616E84),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.volume_up,
                                  color: Color(0xFF303846),
                                ),
                              ),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 4,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF303846),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    height: 4,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF616E84),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 4,
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF303846),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    height: 4,
                                    width: MediaQuery.of(context).size.width /
                                            1.50 -
                                        60,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF616E84),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '2:15',
                                      style: TextStyle(
                                        color: Color(0xFF616E84),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '3:51',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Color(0xFF616E84),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
