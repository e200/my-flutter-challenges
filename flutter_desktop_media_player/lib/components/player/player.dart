import 'package:flutter/material.dart';
import 'package:flutter_desktop_media_player/components/player/button.dart';
import 'package:flutter_desktop_media_player/components/player/buttons.dart';
import 'package:flutter_desktop_media_player/components/player/progress.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool _repeat = false;
  bool _suffle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30,
        top: 30,
        right: 30,
        bottom: 0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Row(),
              ),
              Expanded(
                child: PlayerButtons(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
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
                    PlayerProgress(),
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
    );
  }
}
