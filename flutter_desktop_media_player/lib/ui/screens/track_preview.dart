import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_desktop_media_player/components/player/player.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar_cover.dart';
import 'package:flutter_desktop_media_player/data/track.dart';

class TrackPreview extends StatelessWidget {
  final Track track;
  final String tag;

  const TrackPreview({
    Key key,
    this.track,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        constraints: BoxConstraints(
          maxHeight: 760,
          maxWidth: 800,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: tag,
              child: SidebarCover(
                image: track.coverUrl,
              ),
            ),
            SizedBox(height: 15),
            Hero(
              tag: 'player',
              child: Player(),
            ),
          ],
        ),
      ),
    );
  }
}
