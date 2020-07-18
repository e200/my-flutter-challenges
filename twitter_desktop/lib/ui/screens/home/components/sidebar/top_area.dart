import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarTopArea extends StatelessWidget {
  final EdgeInsets padding;
  final Function onCollapseChanged;

  const SidebarTopArea({
    Key key,
    this.padding,
    this.onCollapseChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: padding,
            child: Image.asset(
              'resources/images/twitter_logo.png',
              fit: BoxFit.contain,
              width: 40,
            ),
          ),
        ),
        /* Spacer(),
        IconButton(
          icon: Transform.rotate(
            angle: 0.6109,
            child: Icon(Icons.unfold_less),
          ),
          onPressed: onCollapseChanged,
        ), */
      ],
    );
  }
}
