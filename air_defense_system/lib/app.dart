import 'package:air_defense_system/widget.dart';
import 'package:flutter/material.dart';

class AirDefenseSystemApp extends StatelessWidget {
  const AirDefenseSystemApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Container(
            width: 500,
            height: 500,
            margin: const EdgeInsets.all(15),
            child: const AirDefenseSystem(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
