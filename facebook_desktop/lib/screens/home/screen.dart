import 'package:facebook_desktop/components/last_chats/widget.dart';
import 'package:facebook_desktop/screens/home/components/top_bar/widget.dart';
import 'package:facebook_desktop/screens/home/feed/widget.dart';
import 'package:facebook_desktop/screens/home/left_bar/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F6FF),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Feed(),
                          ),
                          LastChats(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: LeftBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
