
import 'package:facebook_desktop/components/user_online_status.dart';
import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class FriendCard extends StatelessWidget {
  final String name;
  final String image;
  final bool online;
  final EdgeInsets margin;

  const FriendCard({
    Key key,
    this.name,
    this.image,
    this.online,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: name,
                fontSize: 14,
              ),
              SizedBox(
                height: 7.5,
              ),
              UserOnlineStatus(
                online: online,
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    FeatherIcons.mail,
                    color: Colors.grey,
                    size: 14,
                  ),
                ),
                /* Container(
                  padding: EdgeInsets.only(left: 5, right: 15),
                  child: Icon(
                    FeatherIcons.moreVertical,
                    color: Colors.grey,
                    size: 14,
                  ),
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
