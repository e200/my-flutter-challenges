import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/ui/components/tweet/button.dart';

class TweetBottoms extends StatelessWidget {
  final Tweet tweet;
  final Function onLike;
  final Function onRetweet;

  const TweetBottoms({
    Key key,
    this.tweet,
    this.onLike,
    this.onRetweet,
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
            color: tweet.isRetweeted ? Colors.green : null,
            value: tweet.retweets,
            icon: Transform.rotate(
              angle: 0.0174532925 * 90,
              child: Icon(FeatherIcons.repeat),
            ),
            onTap: onRetweet,
          ),
        ),
        Expanded(
          child: TweetBottomButton(
            color: tweet.isLiked ? Colors.red : null,
            icon: Icon(
              tweet.isLiked ? Icons.favorite : FeatherIcons.heart,
            ),
            value: tweet.likes,
            onTap: onLike,
          ),
        ),
        Expanded(
          child: TweetBottomButton(
            icon: Icon(FeatherIcons.share),
          ),
        ),
      ],
    );
  }
}
