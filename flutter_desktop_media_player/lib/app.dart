import 'package:flutter/material.dart';
import 'package:flutter_desktop_media_player/components/player/player.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar.dart';
import 'package:flutter_desktop_media_player/ui/theme.dart';

class FlutterDesktopMediaPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Media Player',
      theme: getTheme(context),
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Column(
              children: <Widget>[
                Sidebar(),
                Hero(
                  tag: 'player',
                  child: Player(),
                ),
              ],
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
