import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/navigation/item.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/navigation/widget.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/top_area.dart';

class Sidebar extends StatefulWidget {
  final double width;

  const Sidebar({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _currentIndex = 0;

  final _navigation = [
    {
      'icon': FeatherIcons.home,
      'label': 'Home',
    },
    {
      'icon': FeatherIcons.compass,
      'label': 'Explore',
    },
    {
      'icon': FeatherIcons.bell,
      'label': 'Notifications',
    },
    {
      'icon': FeatherIcons.mail,
      'label': 'Messages',
    },
    {
      'icon': FeatherIcons.bookmark,
      'label': 'Bookmarks',
    },
    {
      'icon': FeatherIcons.user,
      'label': 'Profile',
    },
    {
      'icon': FeatherIcons.moreVertical,
      'label': 'More',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF303741),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.05),
          ),
        ],
      ),
      width: widget.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: NavigationBar(
              selectedIndex: _currentIndex,
              children: [
                for (final _navItem in _navigation)
                  NavigationBarItem(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    icon: Icon(
                      _navItem['icon'],
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: _navItem['label'],
                  ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SidebarTopArea(
              padding: const EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}
