import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:twitter_desktop/models/retweet.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/tweet/bottoms.dart';
import 'package:twitter_desktop/ui/components/tweet/header.dart';
import 'package:twitter_desktop/ui/components/tweet/text_content.dart';
import 'package:twitter_desktop/ui/components/tweet/widget.dart';
import 'package:twitter_desktop/ui/components/user.dart';

class RetweetItem extends StatefulWidget {
  final Retweet retweet;
  final Function onRetweet;
  final Function onLike;

  const RetweetItem({
    Key key,
    this.retweet,
    this.onLike,
    this.onRetweet,
  }) : super(key: key);

  @override
  _RetweetItemState createState() => _RetweetItemState();
}

class _RetweetItemState extends State<RetweetItem> {
  @override
  Widget build(BuildContext context) {
    final _retweet = widget.retweet;

    final _cardBackground = TinyColor(
      Theme.of(context).backgroundColor,
    ).lighten(4).color;

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
                      child: UserAvatar(userAvatar: _retweet.user.image),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    TweetHeader(
                      tweet: _retweet,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: TweetTextContent(
                                    text: _retweet.content,
                                  ),
                                ),
                                TweetItem(
                                  tweet: _retweet.tweet,
                                  isPrimary: false,
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
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: TweetBottoms(
              tweet: _retweet,
              onLike: widget.onLike,
              onRetweet: widget.onRetweet,
            ),
          ),
        ],
      ),
    );
  }
}
