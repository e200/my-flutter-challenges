import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarTopArea extends StatelessWidget {
  final EdgeInsets padding;

  const SidebarTopArea({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
          child: Padding(
        padding: padding,
        child: Image.asset(
          'resources/images/twitter_logo.png',
          fit: BoxFit.contain,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
