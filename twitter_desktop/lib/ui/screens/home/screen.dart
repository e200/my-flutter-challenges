import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_desktop/ui/screens/home/components/sidebar/widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
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
    );
  }
}
