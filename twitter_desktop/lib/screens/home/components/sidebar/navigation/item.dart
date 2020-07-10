import 'package:flutter/widgets.dart';

class NavigationBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final EdgeInsets padding;

  const NavigationBarItem({
    Key key,
    this.icon,
    this.label,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          if (label != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 20),
                Flexible(
                  child: Text(label),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
