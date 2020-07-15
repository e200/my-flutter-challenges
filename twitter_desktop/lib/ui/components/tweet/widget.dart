import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/tweet/bottoms.dart';
import 'package:twitter_desktop/ui/components/tweet/header.dart';
import 'package:twitter_desktop/ui/components/user.dart';

class TweetItem extends StatefulWidget {
  final Tweet tweet;
  final bool primary;

  const TweetItem({
    Key key,
    this.tweet,
    this.primary = true,
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
    ).lighten(widget.primary ?  4 : 6).color;

    return AppCard(
      margin: EdgeInsets.all(5),
      background: _cardBackground,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
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
                      padding: const EdgeInsets.only(right: 10),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(_tweet.content),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.primary)
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: TweetBottoms(tweet: _tweet,),
            ),
        ],
      ),
    );
  }
}
