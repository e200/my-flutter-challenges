import 'package:ezanimation/ezanimation.dart';
import 'package:facebook_desktop/components/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ChatCard extends StatefulWidget {
  final String image;
  final String name;
  final String message;
  final EdgeInsets padding;

  const ChatCard({
    Key key,
    this.image,
    this.name,
    this.message,
    this.padding,
  }) : super(key: key);

  @override
  _ChatCardState createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  EzAnimation _animation;

  @override
  void initState() {
    _animation = EzAnimation(
      0.0,
      -5.0,
      Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      context: context,
    );

    _animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_animation.value, 0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          _animation.start();
        },
        onExit: (event) {
          _animation.reverse();
        },
        child: Padding(
          padding: widget.padding ?? const EdgeInsets.all(15),
          child: Container(
            width: 250,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserTile(
                  name: widget.name,
                  image: widget.image,
                  trailing: Icon(
                    FeatherIcons.messageSquare,
                    color: Colors.blue,
                    size: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.message,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animation.dispose();

    super.dispose();
  }
}
