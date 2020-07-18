import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/tweet/bottoms.dart';
import 'package:twitter_desktop/ui/components/tweet/header.dart';
import 'package:twitter_desktop/ui/components/tweet/text_content.dart';
import 'package:twitter_desktop/ui/components/user.dart';

class TweetItem extends StatefulWidget {
  final Tweet tweet;
  final bool isPrimary;
  final Function onRetweet;
  final Function onLike;
  final Function onTap;

  const TweetItem({
    Key key,
    this.tweet,
    this.onLike,
    this.onRetweet,
    this.onTap,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  _TweetItemState createState() => _TweetItemState();
}

class _TweetItemState extends State<TweetItem> {
  @override
  Widget build(BuildContext context) {
    final _tweet = widget.tweet;

    final _cardBackground = TinyColor(
      Theme.of(context).backgroundColor,
    ).lighten(widget.isPrimary ? 4 : 8).color;

    return AppCard(
      padding: const EdgeInsets.all(15),
      background: _cardBackground,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: UserAvatar(userAvatar: _tweet.user.image),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    TweetHeader(
                      tweet: _tweet,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                TweetTextContent(
                                  text: _tweet.content,
                                ),
                                if (_tweet.image != null)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Image.network(
                                        _tweet.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.isPrimary)
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: TweetBottoms(
                tweet: _tweet,
                onLike: widget.onLike,
                onRetweet: widget.onRetweet,
              ),
            ),
        ],
      ),
    );
  }
}
