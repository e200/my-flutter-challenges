import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/tweet_button.dart';
import 'package:twitter_desktop/ui/components/user.dart';
import 'package:twitter_desktop/ui/screens/home/views/tweets/list.dart';
import 'package:twitter_desktop/ui/theme.dart';

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
            child: BlocBuilder<ThemeBloc, bool>(
              bloc: BlocProvider.of<ThemeBloc>(context),
              builder: (context, isDark) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  children: [
                    AppCard(
                      width: 310,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trends for you',
                            style: Theme.of(context).textTheme.headline6.apply(
                                  color: isDark
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.black.withOpacity(.6),
                                ),
                          ),
                          SizedBox(height: 15),
                          Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('#Flutter'),
                                subtitle: Text(
                                  '7.6k tweets',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Icon(
                                  FeatherIcons.chevronDown,
                                  color: isDark
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.black.withOpacity(.6),
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('#Dart'),
                                subtitle: Text(
                                  '3.9k tweets',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Icon(
                                  FeatherIcons.chevronDown,
                                  color: isDark
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.black.withOpacity(.6),
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('#FlutterDesktop'),
                                subtitle: Text(
                                  '1.2k tweets',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Icon(
                                  FeatherIcons.chevronDown,
                                  color: isDark
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.black.withOpacity(.6),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    AppCard(
                      width: 310,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You should follow',
                            style: Theme.of(context).textTheme.headline6.apply(
                                  color: isDark
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.black.withOpacity(.6),
                                ),
                          ),
                          SizedBox(height: 15),
                          Column(
                            children: [
                              UserYouShouldFollow(
                                avatar:
                                    'https://uifaces.co/our-content/donated/t33XAm04.jpg',
                                username: 'robergd',
                                fullname: 'Rober González',
                              ),
                              UserYouShouldFollow(
                                avatar:
                                    'https://uifaces.co/our-content/donated/XdLjsJX_.jpg',
                                username: 'sheyra',
                                fullname: 'Sheyra',
                                isFollowing: true,
                              ),
                              UserYouShouldFollow(
                                avatar:
                                    'https://uifaces.co/our-content/donated/mB6AsKYP.jpg',
                                username: 'San_thoshJ',
                                fullname: 'Santhosh.J',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserYouShouldFollow extends StatelessWidget {
  final String username;
  final String fullname;
  final String avatar;
  final bool isFollowing;

  UserYouShouldFollow({
    Key key,
    this.username,
    this.fullname,
    this.avatar,
    this.isFollowing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          UserAvatar(
            userAvatar: avatar,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fullname),
                        Text(
                          '@' + username,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    RaisedButton(
                      color: isFollowing
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      child: Text(
                        'FOLLOW',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText2.color),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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

class CharacterCounter extends StatefulWidget {
  final int min;
  final int value;

  const CharacterCounter({
    Key key,
    this.min,
    this.value,
  }) : super(key: key);

  @override
  _CharacterCounterState createState() => _CharacterCounterState();
}

class _CharacterCounterState extends State<CharacterCounter> {
  @override
  Widget build(BuildContext context) {
    final _min = widget.min;
    final _value = widget.value;
    final _percentage = _value / _min;

    return CircularPercentIndicator(
      radius: 25,
      lineWidth: 3,
      progressColor: _tweetCharsCountExceeded
          ? Colors.red
          : Theme.of(context).primaryColor,
      percent: _percentage > 1 ? 1 : _percentage,
      center: Visibility(
        visible: _tweetCharsCountExceeded,
        child: Text(
          ((_min - _value) * -1).toString(),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  bool get _tweetCharsCountExceeded => widget.value > widget.min;
}
