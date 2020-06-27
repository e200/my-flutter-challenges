import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.6),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/facebook_logo.jpg',
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
