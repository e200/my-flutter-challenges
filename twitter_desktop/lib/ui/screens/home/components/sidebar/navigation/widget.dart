import 'package:flutter/widgets.dart';

class NavigationBar extends StatelessWidget {
  final int selectedIndex;

  final List<Widget> children;

  const NavigationBar({
    Key key,
    this.selectedIndex,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}
