import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_desktop/bloc/theme_bloc.dart';
import 'package:twitter_desktop/ui/components/user.dart';
import 'package:twitter_desktop/ui/components/user_verfied.dart';

class UserYouShouldFollow extends StatelessWidget {
  final String username;
  final String fullname;
  final String avatar;
  final bool isFollowing;
  final bool isVerified;
  final Function onFollow;

  UserYouShouldFollow({
    Key key,
    this.username,
    this.fullname,
    this.avatar,
    this.isFollowing = false,
    this.isVerified = false,
    this.onFollow,
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
                        Row(
                          children: [
                            Text(fullname),
                            if (isVerified)
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  UserVerfied(),
                                ],
                              ),
                          ],
                        ),
                        Text(
                          '@' + username,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    RaisedButton(
                      elevation: 0,
                      color: isFollowing
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).backgroundColor,
                      child: BlocBuilder<ThemeBloc, bool>(
                          bloc: BlocProvider.of<ThemeBloc>(context),
                          builder: (context, isDark) {
                            return Text(
                              isFollowing ? 'FOLLOWING' : 'FOLLOW',
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            );
                          }),
                      onPressed: onFollow,
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
