import 'package:flutter/material.dart';
import 'package:twitter_desktop/models/retweet.dart';
import 'package:twitter_desktop/models/tweet.dart';
import 'package:twitter_desktop/repositories/tweet.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/retweet.dart';
import 'package:twitter_desktop/ui/components/tweet/widget.dart';

class TweetsList extends StatefulWidget {
  @override
  _TweetsListState createState() => _TweetsListState();
}

class _TweetsListState extends State<TweetsList> {
  List<Tweet> _tweets;

  TweetRepository _tweetRepository;

  bool _isLoading = false;

  @override
  void initState() {
    _tweetRepository = TweetRepository();

    _load();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(10),
      child: Builder(
        builder: (context) {
          if (_isLoading) {
            return Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Wrap(
            runSpacing: 10,
            children: [
              ..._tweets.map((tweet) {
                if (tweet is Retweet) {
                  return RetweetItem(
                    retweet: tweet,
                    onLike: () {
                      setState(() {
                        tweet.isLiked = !tweet.isLiked;

                        if (tweet.isLiked) {
                          tweet.likes++;
                        } else {
                          tweet.likes--;
                        }
                      });
                    },
                    onRetweet: () {
                      setState(() {
                        tweet.isRetweeted = !tweet.isRetweeted;

                        if (tweet.isRetweeted) {
                          tweet.retweets++;
                        } else {
                          tweet.retweets--;
                        }
                      });
                    },
                  );
                }

                return TweetItem(
                  tweet: tweet,
                  onLike: () {
                    setState(() {
                      tweet.isLiked = !tweet.isLiked;

                      if (tweet.isLiked) {
                        tweet.likes++;
                      } else {
                        tweet.likes--;
                      }
                    });
                  },
                  onRetweet: () {
                    setState(() {
                      tweet.isRetweeted = !tweet.isRetweeted;

                      if (tweet.isRetweeted) {
                        tweet.retweets++;
                      } else {
                        tweet.retweets--;
                      }
                    });
                  },
                );
              }).toList(),
              ListTile(
                title: Center(
                  child: Container(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _load() async {
    setState(() {
      _isLoading = true;
    });

    await _tweetRepository.init();

    _tweetRepository.fetch().then((tweets) {
      setState(() {
        _tweets = tweets;
      });
    }).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}
