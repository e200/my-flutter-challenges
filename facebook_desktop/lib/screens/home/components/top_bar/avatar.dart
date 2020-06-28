import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TopBarAvatar extends StatefulWidget {
  @override
  _TopBarAvatarState createState() => _TopBarAvatarState();
}

class _TopBarAvatarState extends State<TopBarAvatar>
    with SingleTickerProviderStateMixin {
  Animation<Color> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    _animation = ColorTween(
      begin: Colors.grey.withOpacity(.4),
      end: Colors.blue.withOpacity(.6),
    ).animate(_animationController);

    _animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _animationController.forward();
        });
      },
      onExit: (event) {
        setState(() {
          _animationController.reverse();
        });
      },
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: _animation.value,
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/avatar.jpg',
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }
}
