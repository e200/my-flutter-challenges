import 'package:flutter/material.dart';

void main() {
  runApp(MacbookKeyboardApp());
}

class MacbookKeyboardApp extends StatelessWidget {
  static final appTitle = 'Macbook Keyboard';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MacbookKeyboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MacbookKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mackBookColor = Color(0xFFFFD8BF);

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: 854,
          height: 598,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: mackBookColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Container(
            width: 778,
            height: 330,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(.2)),
                BoxShadow(
                  color: mackBookColor,
                  blurRadius: 5,
                  spreadRadius: -5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
