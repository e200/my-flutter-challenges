import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/ui/app_icons.dart';

class TweetHeader extends StatelessWidget {
  final Tweet tweet;

  TweetHeader({
    Key key,
    @required this.tweet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tweet.user.fullname,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        if (tweet.user.isVerified)
          Row(
            children: [
              SizedBox(width: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    color: Colors.white,
                  ),
                  Icon(
                    FlutterApp.verified,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        SizedBox(width: 5),
        Text(
          '@' + tweet.user.name,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        Spacer(),
        Text(
          tweet.time,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
