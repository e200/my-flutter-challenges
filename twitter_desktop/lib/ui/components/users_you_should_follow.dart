import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/title_card.dart';
import 'package:twitter_desktop/ui/components/user_you_should_follow.dart';

class UsersYouShouldFollow extends StatefulWidget {
  UsersYouShouldFollow({
    Key key,
  }) : super(key: key);

  @override
  _UsersYouShouldFollowState createState() => _UsersYouShouldFollowState();
}

class _UsersYouShouldFollowState extends State<UsersYouShouldFollow> {
  final _users = <bool>[
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, isDark) {
        return ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          children: [
            TitledCard(
              title: 'Trends for you',
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
              title: 'You should follow',
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
                    isFollowing: _users[0],
                    isVerified: true,
                    onFollow: () {
                      setState(() {
                        _users[0] = !_users[0];
                      });
                    },
                  ),
                  UserYouShouldFollow(
                    avatar:
                        'https://uifaces.co/our-content/donated/XdLjsJX_.jpg',
                    username: 'sheyra',
                    fullname: 'Sheyra',
                    isFollowing: _users[1],
                    isVerified: true,
                    onFollow: () {
                      setState(() {
                        _users[1] = !_users[1];
                      });
                    },
                  ),
                  UserYouShouldFollow(
                    avatar:
                        'https://uifaces.co/our-content/donated/mB6AsKYP.jpg',
                    username: 'San_thoshJ',
                    fullname: 'Santhosh.J',
                    isFollowing: _users[2],
                    onFollow: () {
                      setState(() {
                        _users[2] = !_users[2];
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
