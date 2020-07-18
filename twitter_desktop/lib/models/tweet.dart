import 'package:twitter_desktop/models/user.dart';

class Tweet {
  int id;
  String content;
  String time;
  String image;
  String video;
  int comments;
  int retweets;
  int likes;
  User user;

  bool isRetweeted;
  bool isLiked;

  Tweet({
    this.id,
    this.comments,
    this.content,
    this.image,
    this.video,
    this.likes,
    this.retweets,
    this.time,
    this.user,
    this.isLiked = false,
    this.isRetweeted = false,
  });
}
