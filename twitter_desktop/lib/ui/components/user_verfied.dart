
import 'package:flutter/material.dart';
import 'package:twitter_desktop/ui/app_icons.dart';

class UserVerfied extends StatelessWidget {
  const UserVerfied({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          color: Colors.white,
        ),
        Icon(
          FlutterApp.verified,
          color: Theme.of(context).primaryColor,
          size: 16,
        ),
      ],
    );
  }
}
