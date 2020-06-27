import 'package:facebook_desktop/screens/home/left_bar/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LeftBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LeftBarButton(
            icon: FeatherIcons.mail,
            badge: '10',
          ),
          SizedBox(
            height: 5,
          ),
          LeftBarButton(
            icon: FeatherIcons.search,
          ),
          SizedBox(
            height: 5,
          ),
          LeftBarButton(
            icon: FeatherIcons.bell,
            badge: '20',
          ),
        ],
      ),
    );
  }
}
