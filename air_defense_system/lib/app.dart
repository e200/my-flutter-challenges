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
        backgroundColor: const Color(0xFF001600),
        body: Center(
          child: AirDefenseSystem(
            radarRange: 10,
            enemySize: 25,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
