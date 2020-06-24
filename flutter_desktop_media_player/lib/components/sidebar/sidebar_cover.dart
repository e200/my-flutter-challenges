import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarCover extends StatelessWidget {
  final String image;

  const SidebarCover({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
