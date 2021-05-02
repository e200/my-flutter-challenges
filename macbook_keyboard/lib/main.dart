import 'package:flutter/material.dart';

final mackBookColor = Color(0xFFF8CDBC);

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
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: 854,
          height: 600,
          padding: EdgeInsets.only(
            left: 30,
            top: 30,
            right: 30,
          ),
          decoration: BoxDecoration(
            color: mackBookColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [MacbookKeys(), Center(child: TrackPad())],
          ),
        ),
      ),
    );
  }
}

class MacbookKeys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 778,
      height: 330,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.3)),
          BoxShadow(
            color: mackBookColor,
            blurRadius: 3,
            spreadRadius: -3,
          ),
        ],
      ),
    );
  }
}

class TrackPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 220,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFA87961),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
