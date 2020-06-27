import 'package:ezanimation/ezanimation.dart';
import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      1.0,
      1.05,
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
    return Transform.scale(
      scale: _animation.value,
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
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 5,
                              offset: Offset(0, 2)),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          image: NetworkImage(
                            widget.image,
                          ),
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: widget.name,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '12 min ago',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    /* Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        FeatherIcons.messageSquare,
                        color: Colors.blue,
                      ),
                    ), */
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.message,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
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
