import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_desktop_media_player/components/image_preview.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar_cover.dart';
import 'package:flutter_desktop_media_player/data/music.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  List<Music> _library = [];
  MusicRepository _musicRepository;

  bool _isLoading = false;

  @override
  void initState() {
    _musicRepository = MusicRepository();

    _load();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 340,
          child: BlurImage(
            image: 'assets/playlist.jpg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(250),
              1: FixedColumnWidth(150),
              2: FixedColumnWidth(150),
              3: FixedColumnWidth(100),
              4: FixedColumnWidth(80),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Title',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Artiste',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Album',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Added',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Duration',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              for (Music _music in _library)
                TableRow(
                  decoration: BoxDecoration(
                    // color: Color(0xFF1F2631),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  children: [
                    PlaylistTableCell(text: _music.title),
                    PlaylistTableCell(text: _music.artist),
                    PlaylistTableCell(text: _music.album),
                    PlaylistTableCell(text: _music.createdAt),
                    PlaylistTableCell(
                      text: _music.duration,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }

  void _load() {
    setState(() {
      _isLoading = true;
    });

    _musicRepository.getAll().then((musics) {
      setState(() {
        _library.addAll(musics);
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

class BlurImage extends StatelessWidget {
  final String image;

  const BlurImage({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0,
                sigmaY: 15.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color(0xFF0F141D),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: PlaylistHeader(),
        ),
      ],
    );
  }
}

class PlaylistTableCell extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const PlaylistTableCell({
    Key key,
    this.text,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: TableCell(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ImagePreview(
                    image: 'assets/playlist.jpg',
                    tag: 'cover-playlist',
                  );
                },
              ),
            );
          },
          child: Hero(
            tag: 'cover-playlist',
            child: SidebarCover(
              image: 'assets/playlist.jpg',
              width: 200,
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pure fight!!1 🔥',
                style: TextStyle(fontSize: 48),
              ),
              Wrap(
                children: [
                  Text(
                    'Created by',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .color
                            .withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Wolfgang Mozart'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
