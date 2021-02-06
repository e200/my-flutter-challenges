import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_desktop_media_player/data/track.dart';
import 'package:flutter_desktop_media_player/ui/screens/track_preview.dart';
import 'package:flutter_desktop_media_player/components/playlist/widget.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar_cover.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar_tile.dart';
import 'package:flutter_desktop_media_player/ui/widgets/blur.dart';
import 'package:line_icons/line_icons.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _playingTrack = tracks.first;

    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 280,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: 300,
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      SidebarTile(
                        icon: LineIcons.home,
                        title: 'Home',
                      ),
                      SidebarTile(
                        icon: LineIcons.inbox,
                        title: 'Browse',
                      ),
                      SizedBox(height: 15),
                      SidebarTile(title: 'Library'),
                      SidebarTile(
                        title: 'Playlists',
                        isReadOnly: true,
                      ),
                      Column(
                        children: <Widget>[
                          SidebarTile(title: 'Kuduro!!! 🔥'),
                          SidebarTile(title: 'Afro House 🦄', isActive: true),
                          SidebarTile(title: 'Kizomba'),
                          SidebarTile(title: 'Most played'),
                          SidebarTile(title: 'Recently played'),
                          SidebarTile(title: 'Archive'),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              fullscreenDialog: true,
                              barrierDismissible: true,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return TrackPreview(
                                  track: _playingTrack,
                                  tag: 'current-cover',
                                );
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return BlurLayer(
                                  animation: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'current-cover',
                          child: SidebarCover(
                            image: _playingTrack.coverUrl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Playlist()),
        ],
      ),
    );
  }
}
