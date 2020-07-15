import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserAvatar extends StatefulWidget {
  final String username;
  final String userAvatar;
  final double width;
  final double height;

  UserAvatar({
    Key key,
    this.username,
    this.userAvatar,
    this.width = 40,
    this.height = 40,
  }) : super(key: key);

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.username != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.username,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 15),
            ],
          ),
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(.2),
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FadeInImage(
              image: NetworkImage(widget.userAvatar),
              placeholder: AssetImage('resources/images/user_placeholder.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
