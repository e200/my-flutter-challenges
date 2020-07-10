import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool enabled;
  final Widget child;

  const AppCard({
    Key key,
    this.margin,
    this.padding,
    this.enabled,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      child: child,
    );
  }
}
