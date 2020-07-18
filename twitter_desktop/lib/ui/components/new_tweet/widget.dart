import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/new_tweet/character_counter.dart';
import 'package:twitter_desktop/ui/components/tweet_button.dart';
import 'package:twitter_desktop/ui/components/user.dart';
import 'package:twitter_desktop/ui/theme.dart';

class NewTweet extends StatefulWidget {
  NewTweet({
    Key key,
  }) : super(key: key);

  @override
  _NewTweetState createState() => _NewTweetState();
}

class _NewTweetState extends State<NewTweet> {
  EzAnimation _bottomButtonColorAnimation;
  EzAnimation _charsCounterOpacityAnimation;

  final _tweetFieldFocusNode = FocusNode();
  final _tweetTextController = TextEditingController();

  final _maxTweetChars = 180;

  @override
  void initState() {
    _charsCounterOpacityAnimation = EzAnimation(
      0.0,
      1.0,
      Duration(milliseconds: 300),
    );

    _bottomButtonColorAnimation = EzAnimation.tween(
      ColorTween(
        begin: Colors.grey,
        end: AppTheme.primaryColor,
      ),
      Duration(milliseconds: 300),
    );

    _tweetTextController.addListener(() {
      setState(() {
        if (_tweetTextController.text.isNotEmpty) {
          _charsCounterOpacityAnimation.start();
        } else {
          _charsCounterOpacityAnimation.reverse();
        }
      });
    });

    _charsCounterOpacityAnimation.addListener(() {
      setState(() {});
    });

    _bottomButtonColorAnimation.addListener(() {
      setState(() {});
    });

    _tweetFieldFocusNode.addListener(() {
      if (_tweetFieldFocusNode.hasFocus) {
        _bottomButtonColorAnimation.start();
      } else {
        _bottomButtonColorAnimation.reverse();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, isDark) {
        return AppCard(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAvatar(
                    userAvatar:
                        'https://pbs.twimg.com/profile_images/1276524106662449152/RWkF0y0i_reasonably_small.jpg',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: TextFormField(
                      focusNode: _tweetFieldFocusNode,
                      controller: _tweetTextController,
                      maxLines: null,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        labelText: 'Whats going on?',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          color: isDark ? Colors.white.withOpacity(.3) : null,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: _bottomButtonColorAnimation.value,
                    icon: Icon(FeatherIcons.image),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: _bottomButtonColorAnimation.value,
                    icon: Icon(FeatherIcons.barChart2),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: _bottomButtonColorAnimation.value,
                    icon: Icon(FeatherIcons.smile),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: _bottomButtonColorAnimation.value,
                    icon: Icon(FeatherIcons.calendar),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Opacity(
                            opacity: _charsCounterOpacityAnimation.value,
                            child: CharacterCounter(
                              min: _maxTweetChars,
                              value: _tweetTextController.text.length,
                            ),
                          ),
                          SizedBox(width: 10),
                          TweetButton(
                            contentPadding: EdgeInsets.zero,
                            onPressed: _tweetTextController.text.length >
                                    _maxTweetChars
                                ? null
                                : () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
