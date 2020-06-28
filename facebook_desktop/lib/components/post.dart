import 'package:facebook_desktop/components/user_tile.dart';
import 'package:facebook_desktop/screens/home/feed/card.dart';
import 'package:facebook_desktop/screens/post/widget.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:like_button/like_button.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final _faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: FeedCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: UserTile(
                name: _faker.person.name(),
                image:
                    'https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
                trailing: Icon(
                  FeatherIcons.moreVertical,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15)
                  .copyWith(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This weekend was unforgettable. Thanks my friends <3'),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return PostScreen();
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'post-hero',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://res.cloudinary.com/practicaldev/image/fetch/s--EPQDBC2W--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://cdn-images-1.medium.com/max/1600/1%2AMGZ23iwd1nuouibCC-_-xg.jpeg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LikeButton(
                      likeBuilder: (isLiked) {
                        return Icon(
                          Icons.thumb_up,
                          color: isLiked ? Colors.blue : Colors.grey,
                          size: 20,
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: LikeButton(
                      likeBuilder: (isLiked) {
                        return Icon(
                          Icons.chat_bubble,
                          color: Colors.grey,
                          size: 20,
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: LikeButton(
                      likeBuilder: (isLiked) {
                        return Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
