import 'dart:math';

import 'package:circular_segment_button/circular_segment_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Segment> _segments = [
    Segment(
      color: Colors.red,
      strokeWidth: 15,
    ),
    Segment(
      color: Colors.green,
      strokeWidth: 15,
    ),
    Segment(
      color: Colors.blue,
      strokeWidth: 15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularSegmentButton(
          width: 100,
          height: 100,
          gap: 15,
          segments: _segments,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final _colorIndex = Random().nextInt(Colors.primaries.length);

          _segments.add(
            Segment(
              color: Colors.primaries[_colorIndex],
              strokeWidth: 15,
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
