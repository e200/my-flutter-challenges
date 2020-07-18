import 'package:twitter_desktop/models/retweet.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/models/user.dart';

class TweetRepository {
  final _users = [
    User(
      fullname: 'Eleandro Duzentos',
      name: 'iam_e200',
      image:
          'https://pbs.twimg.com/profile_images/1276524106662449152/RWkF0y0i_reasonably_small.jpg',
      isVerified: true,
    ),
    User(
      fullname: 'Kelven Galvão 💙',
      name: 'irvine5k',
      image:
          'https://pbs.twimg.com/profile_images/1229396099275853824/GBfIacU3_reasonably_small.jpg',
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
    final _tweet1 = Tweet(
      id: 1,
      user: _users.firstWhere((user) => user.name == 'iam_e200'),
      comments: 3,
      likes: 49,
      retweets: 7,
      content: '''Facebook Redesign built with @FlutterDev

This weekend was unforgettable! Thanks to my friends that keeps making Flutter awesome!!!

@Zfinix1 @_iamEtornam @lesliearkorful @Flutter_Africa @timsneath @mallenkb @rodydavis @AngolaFlutter @flutterango''',
      image:
          'https://github.com/e200/my-flutter-challenges/raw/master/twitter_desktop/resources/gif/facebook_screenshot.gif',
      time: '22 min',
    );

    _tweets.add(_tweet1);

    _tweets.add(
      Retweet(
        user: _users.firstWhere((user) => user.name == 'NoobScorpio'),
        comments: 2,
        likes: 3,
        retweets: 0,
        content: 'Its lookin good bro! 👌🔥🔥',
        time: '13 mins',
        tweet: _tweet1,
      ),
    );

    final _tweet2 = Tweet(
      id: 2,
      user: _users.firstWhere((user) => user.name == 'irvine5k'),
      comments: 19,
      likes: 67,
      retweets: 4,
      content:
          'Não sou uma pessoa de ler livros, mas recentemente comprei um livro chamado "A Philosophy of Software Design" e venho gostado demais, expandiu muito minha mente sobre desenvolvimento de software, o próximo da lista é "The Pragmatic Programmer", alguém tem recomendações?',
      time: '7 mins',
    );

    _tweets.add(_tweet2);
  }

  Future<List<Tweet>> fetch() async {
    await Future.delayed(Duration(seconds: 2));

    return _tweets.reversed.toList();
  }
}
