import 'package:facebook_desktop/screens/home/feed/stories/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stories(),
        Row(
          children: [
            Column(
              children: [
                // Poster(),
              ],
            )
          ],
        ),
      ],
    );
  }
}
