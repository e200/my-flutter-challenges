import 'package:flutter/material.dart';
import 'package:flutter_desktop_media_player/components/player/button.dart';
import 'package:flutter_desktop_media_player/components/player/buttons.dart';
import 'package:flutter_desktop_media_player/components/player/progress.dart';
import 'package:flutter_desktop_media_player/data/track.dart';
import 'package:flutter_desktop_media_player/ui/theme.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool _repeat = false;
  bool _suffle = false;

  @override
  Widget build(BuildContext context) {
    final _playingTrack = tracks.first;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: scaffoldBackgroundColor,
        ),
        padding: EdgeInsets.only(
          left: 30,
          top: 20,
          right: 30,
          bottom: 0,
        ),
        child: Wrap(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _playingTrack.title,
                        style: TextStyle(
                          color: Color(0xFFC4C1C2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _playingTrack.artist,
                        style: TextStyle(
                          color: Color(0xFF4E586B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: PlayerButtons()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      PlayerButton(
                        icon: Icons.shuffle,
                        isActive: _suffle,
                        onTap: () {
                          setState(() {
                            _suffle = !_suffle;
                          });
                        },
                      ),
                      PlayerButton(
                        icon: Icons.repeat,
                        isActive: _repeat,
                        onTap: () {
                          setState(() {
                            _repeat = !_repeat;
                          });
                        },
                      ),
                      PlayerButton(
                        icon: Icons.volume_up,
                        isActive: true,
                      ),
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 4,
                              constraints: BoxConstraints(maxWidth: 100),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF303846),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 50,
                              constraints: BoxConstraints(maxWidth: 100),
                              decoration: BoxDecoration(
                                color: Color(0xFF616E84),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PlayerProgress(),
                  SizedBox(height: 5),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '4:15',
                          style: TextStyle(
                            color: Color(0xFF616E84),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '6:30',
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
            ),
          ],
        ),
      ),
    );
  }
}
