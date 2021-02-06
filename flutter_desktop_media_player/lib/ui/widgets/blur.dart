import 'dart:ui';

import 'package:flutter/material.dart';

class BlurLayer extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const BlurLayer({
    Key key,
    this.animation,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: animation.value * 15.0,
                sigmaY: animation.value * 15.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color(0xFF0F141D),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
