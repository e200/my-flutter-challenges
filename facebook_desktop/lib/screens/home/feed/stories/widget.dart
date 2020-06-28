import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:facebook_desktop/screens/home/feed/stories/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SectionTitle(
          title: 'STORIES',
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        child: Row(
          children: [
            Flexible(
              child: Story(
                story: 'https://picsum.photos/id/1005/300/350',
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Flexible(
              child: Story(
                avatar:
                    'https://pbs.twimg.com/profile_images/642171524569427968/z2S0ttIf.jpg',
                story: 'https://picsum.photos/id/184/300/350',
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Flexible(
              child: Story(
                avatar:
                    'https://images.unsplash.com/photo-1508091073125-ced32109d0ee?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
                story: 'https://picsum.photos/id/16/300/350',
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Flexible(
              child: Story(
                avatar: 'https://pbs.twimg.com/profile_images/1095180025668743168/LgPx_hOQ.jpg',
                story: 'https://picsum.photos/id/188/300/350',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
