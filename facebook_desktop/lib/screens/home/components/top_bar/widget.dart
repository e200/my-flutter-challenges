import 'package:facebook_desktop/screens/home/components/top_bar/app_logo.dart';
import 'package:facebook_desktop/screens/home/components/top_bar/avatar.dart';
import 'package:facebook_desktop/screens/home/components/top_bar/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppLogo(),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopBarButton(
                  icon: FeatherIcons.home,
                  isActive: _selectedPage == 0,
                  onTap: () {
                    setState(() {
                      _selectedPage = 0;
                    });
                  },
                ),
                TopBarButton(
                  icon: FeatherIcons.youtube,
                  isActive: _selectedPage == 1,
                  onTap: () {
                    setState(() {
                      _selectedPage = 1;
                    });
                  },
                ),
                TopBarButton(
                  icon: FeatherIcons.grid,
                  isActive: _selectedPage == 2,
                  onTap: () {
                    setState(() {
                      _selectedPage = 2;
                    });
                  },
                ),
                TopBarAvatar(),
                TopBarButton(
                  icon: FeatherIcons.users,
                  isActive: _selectedPage == 3,
                  onTap: () {
                    setState(() {
                      _selectedPage = 3;
                    });
                  },
                ),
                TopBarButton(
                  icon: FeatherIcons.zap,
                  isActive: _selectedPage == 4,
                  onTap: () {
                    setState(() {
                      _selectedPage = 4;
                    });
                  },
                ),
                TopBarButton(
                  icon: FeatherIcons.smile,
                  isActive: _selectedPage == 5,
                  onTap: () {
                    setState(() {
                      _selectedPage = 5;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                color: Colors.grey.withOpacity(.6),
                icon: Icon(FeatherIcons.settings),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
