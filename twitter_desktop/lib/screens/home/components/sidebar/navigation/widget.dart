import 'package:flutter/widgets.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/navigation/item.dart';

class NavigationBar extends StatelessWidget {
  final int selectedIndex;
  final List<NavigationBarItem> children;

  const NavigationBar({
    Key key,
    this.selectedIndex,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: children,
    );
  }
}
