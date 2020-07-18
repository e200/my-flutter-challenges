import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/new_tweet/widget.dart';
import 'package:twitter_desktop/ui/components/title_card.dart';
import 'package:twitter_desktop/ui/components/user.dart';
import 'package:twitter_desktop/ui/components/user_verfied.dart';
import 'package:twitter_desktop/ui/components/user_you_should_follow.dart';
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
            child: BlocBuilder<ThemeBloc, bool>(
              bloc: BlocProvider.of<ThemeBloc>(context),
              builder: (context, isDark) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  children: [
                    TitledCard(
                      width: 310,
                      padding: EdgeInsets.all(15),
                      child: Column(
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
                    ),
                    SizedBox(height: 15),
                    TitledCard(
                      width: 310,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            isVerified: true,
                          ),
                          UserYouShouldFollow(
                            avatar:
                                'https://uifaces.co/our-content/donated/mB6AsKYP.jpg',
                            username: 'San_thoshJ',
                            fullname: 'Santhosh.J',
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
