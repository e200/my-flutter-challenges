import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final Widget title;
  final Widget child;

  const FeedCard({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title != null ? Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: title,
      ) : SizedBox(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
