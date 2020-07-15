import 'package:twitter_desktop/models/retweet.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/models/user.dart';

class TweetRepository {
  final _users = [
    User(
      fullname: 'Eleandro Duzentos',
      name: 'iam_e200',
      image: 'https://avatars0.githubusercontent.com/u/20504726?s=120&v=4',
      isVerified: true,
    ),
    User(
      fullname: 'Tyna Sneathie',
      name: 'tinasneathie',
      image: 'https://randomuser.me/api/portraits/women/9.jpg',
    ),
    User(
      fullname: 'NoobSays',
      name: 'NoobScorpio',
      image:
          'https://pbs.twimg.com/profile_images/1242943445842477057/hVq7km_T_bigger.jpg',
    ),
  ];

  final List<Tweet> _tweets = [];

  init() async {
    final _mainTweet = Tweet(
      user: _users.firstWhere((user) => user.name == 'iam_e200'),
      comments: 3,
      likes: 49,
      retweets: 7,
      content: 'Twitter Redesign built with @FlutterDev',
      time: '7 mins',
      retweeted: true,
      liked: true,
    );

    _tweets.add(_mainTweet);

    _tweets.add(
      Retweet(
        user: _users.firstWhere((user) => user.name == 'NoobScorpio'),
        comments: 2,
        likes: 3,
        content: 'Its lookin good bro! 👌🔥🔥',
        time: '10 secs',
        tweet: _mainTweet,
        liked: true,
      ),
    );
  }

  Future<List<Tweet>> fetch() async {
    await Future.delayed(Duration(seconds: 2));

    return _tweets;
  }
}
