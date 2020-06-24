import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Playlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 340,
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/playlist.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                height: 340,
                child: ClipRect(
                                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                    child: new Container(
                      decoration:
                          new BoxDecoration(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
