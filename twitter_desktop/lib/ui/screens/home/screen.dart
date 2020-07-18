import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_desktop/ui/screens/home/components/sidebar/widget.dart';
import 'package:twitter_desktop/ui/screens/home/components/topbar/widget.dart';
import 'package:twitter_desktop/ui/screens/home/views/profile/view.dart';
import 'package:twitter_desktop/ui/screens/home/views/tweets/view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 200,
              right: 0,
              bottom: 0,
              child: PageView(
                controller: _pageController,
                children: [
                  TweetsView(),
                  ProfileView(),
                ],
              ),
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
                onSelectPage: (page) {
                  _pageController.animateToPage(
                    page,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
