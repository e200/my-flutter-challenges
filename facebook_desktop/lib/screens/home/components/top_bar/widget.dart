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
  bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        80,
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
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
              flex: 2,
              child: Row(
                children: [
                  TopBarButton(
                    icon: FeatherIcons.home,
                    isActive: _isActive,
                    onTap: () {
                      setState(() {
                        _isActive = true;
                      });
                    },
                  ),
                  TopBarButton(
                    icon: FeatherIcons.youtube,
                  ),
                  TopBarButton(
                    icon: FeatherIcons.grid,
                  ),
                  TopBarAvatar(),
                  TopBarButton(
                    icon: FeatherIcons.users,
                  ),
                  TopBarButton(
                    icon: FeatherIcons.zap,
                  ),
                  TopBarButton(
                    icon: FeatherIcons.smile,
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
      ),
    );
  }
}
