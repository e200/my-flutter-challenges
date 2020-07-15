import 'package:twitter_desktop/models/user.dart';

class Tweet {
  String content;
  String time;
  int comments;
  int retweets;
  int likes;
  User user;

  bool retweeted;
  bool liked;

  Tweet({
    this.comments,
    this.content,
    this.likes,
    this.retweets,
    this.time,
    this.user,
    this.liked = false,
    this.retweeted = false,
  });
}
