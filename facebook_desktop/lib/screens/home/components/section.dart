import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Section extends StatelessWidget {
  final Widget title;
  final Widget child;
  final EdgeInsets padding;

  const Section({
    Key key,
    this.title,
    this.child,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          if (child != null) child,
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline6);
  }
}
