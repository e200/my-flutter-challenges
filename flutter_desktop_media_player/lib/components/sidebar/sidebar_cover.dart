import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarCover extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final EdgeInsets padding;

  const SidebarCover({
    Key key,
    this.image,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? EdgeInsets.only(
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
          width: width,
          height: height,
        ),
      ),
    );
  }
}
