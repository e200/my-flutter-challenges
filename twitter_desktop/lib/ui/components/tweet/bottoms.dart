import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/models/tweet.dart';

class TweetBottoms extends StatelessWidget {
  final Tweet tweet;

  const TweetBottoms({
    Key key,
    this.tweet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TweetBottomButton(
            icon: Icon(FeatherIcons.messageCircle),
            value: tweet.comments,
          ),
        ),
        Expanded(
          child: TweetBottomButton(
            color: tweet.retweeted ? Colors.green : null,
            value: tweet.retweets,
            icon: Transform.rotate(
              angle: 0.0174532925 * 90,
              child: Icon(FeatherIcons.repeat),
            ),
          ),
        ),
        Expanded(
          child: TweetBottomButton(
            color: tweet.liked ? Colors.red : null,
            icon: Icon(tweet.liked ? Icons.favorite : FeatherIcons.heart),
            value: tweet.likes,
          ),
        ),
        Expanded(
          child: TweetBottomButton(icon: Icon(FeatherIcons.share)),
        ),
      ],
    );
  }
}

class TweetBottomButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final int value;

  const TweetBottomButton({
    Key key,
    this.icon,
    this.color,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        padding: EdgeInsets.zero,
        color: color,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            if (value != null && value > 0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(value.toString()),
                ],
              ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
