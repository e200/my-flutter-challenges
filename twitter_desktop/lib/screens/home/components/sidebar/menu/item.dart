import 'package:flutter/widgets.dart';

class NavigationBarItem extends StatelessWidget {
  final Widget icon;
  final String label;

  const NavigationBarItem({
    Key key,
    this.icon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          icon,
          if (label != null) Text(label),
        ],
      ),
    );
  }
}
