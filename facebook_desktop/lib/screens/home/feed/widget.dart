import 'package:facebook_desktop/components/post.dart';
import 'package:facebook_desktop/screens/home/components/poster.dart';
import 'package:facebook_desktop/screens/home/feed/stories/widget.dart';
import 'package:facebook_desktop/screens/home/feed/suggested_friends/widget.dart';
import 'package:facebook_desktop/screens/home/feed/your_friends/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stories(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Poster(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Post(),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30,),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  YourFriends(),
                  SuggestedFriends(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
