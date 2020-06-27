import 'package:flutter/widgets.dart';

class PlayerProgress extends StatefulWidget {
  @override
  _PlayerProgressState createState() => _PlayerProgressState();
}

class _PlayerProgressState extends State<PlayerProgress> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            color: Color(0xFF303846),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width / 1.50 - 60,
          decoration: BoxDecoration(
            color: Color(0xFF616E84),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
