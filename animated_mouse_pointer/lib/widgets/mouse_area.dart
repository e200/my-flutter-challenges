import 'package:animated_mouse_pointer/widgets/mouse_pointer/widget.dart';
import 'package:flutter/material.dart';

class MouseArea extends StatefulWidget {
  @override
  _MouseAreaState createState() => _MouseAreaState();
}

class _MouseAreaState extends State<MouseArea> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {},
      child: Stack(
        fit: StackFit.expand,
        children: [
          MousePointer(),
        ],
      ),
    );
  }
}
