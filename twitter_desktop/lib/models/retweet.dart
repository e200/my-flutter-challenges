import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/models/user.dart';

class Retweet extends Tweet {
  String content;
  String time;
  int comments;
  int retweets;
  int likes;

  bool isRetweeted;
  bool isLiked;

  User user;
  Tweet tweet;

  Retweet({
    this.comments,
    this.content,
    this.likes,
    this.retweets,
    this.time,
    this.user,
    this.tweet,
    this.isLiked = false,
    this.isRetweeted = false,
  });
}
