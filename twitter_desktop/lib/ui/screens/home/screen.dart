import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_desktop/ui/screens/home/components/sidebar/widget.dart';
import 'package:twitter_desktop/ui/screens/home/components/topbar/widget.dart';
import 'package:twitter_desktop/ui/screens/home/views/activity/view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 60,
                left: 200,
              ),
              child: ActivityView(),
            ),
            Positioned(
              left: 200,
              top: 0,
              right: 0,
              child: Align(
                child: Topbar(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: Sidebar(
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
