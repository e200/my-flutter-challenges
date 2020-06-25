import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_desktop_media_player/components/sidebar/sidebar_cover.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';

class ImagePreview extends StatelessWidget {
  final String image;
  final String tag;

  const ImagePreview({
    Key key,
    this.image,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F141D),
      body: Stack(
        children: [
          Center(
            child: PinchZoomImage(
              image: Hero(
                tag: tag,
                child: SidebarCover(
                  image: image,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 15,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
