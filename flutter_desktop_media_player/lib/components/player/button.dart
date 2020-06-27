import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final Function onTap;

  PlayerButton({
    Key key,
    this.icon,
    this.isActive,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Icon(
          icon,
          color: isActive ? Color(0xFF616E84) : Color(0xFF303846),
        ),
      ),
    );
  }
}
