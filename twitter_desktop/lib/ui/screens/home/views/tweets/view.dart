import 'package:flutter/material.dart';
import 'package:twitter_desktop/ui/components/new_tweet/widget.dart';
import 'package:twitter_desktop/ui/components/users_you_should_follow.dart';
import 'package:twitter_desktop/ui/screens/home/views/tweets/list.dart';

class TweetsView extends StatefulWidget {
  @override
  _TweetsViewState createState() => _TweetsViewState();
}

class _TweetsViewState extends State<TweetsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 600,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shrinkWrap: true,
                  children: [
                    NewTweet(),
                    SizedBox(height: 15),
                    TweetsList(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: UsersYouShouldFollow(),
          ),
        ],
      ),
    );
  }
}
