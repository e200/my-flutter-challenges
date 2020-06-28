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
      padding: padding ?? EdgeInsets.zero,
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
  final double fontSize;

  const SectionTitle({
    Key key,
    this.title,
    this.fontSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headline6.copyWith(fontSize: fontSize),
    );
  }
}
