import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TopBarButton extends StatefulWidget {
  final IconData icon;
  final bool isActive;
  final Function onTap;

  const TopBarButton({
    Key key,
    this.icon,
    this.isActive,
    this.onTap,
  }) : super(key: key);

  @override
  _TopBarButtonState createState() => _TopBarButtonState();
}

class _TopBarButtonState extends State<TopBarButton>
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
      begin: Colors.grey.withOpacity(.6),
      end: Colors.blue.withOpacity(.6),
    ).animate(_animationController);

    _animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void didUpdateWidget(TopBarButton oldWidget) {
    if (widget.isActive) {
      setState(() {
        _animationController.forward();
      });
    } else {
      setState(() {
        _animationController.reverse();
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            color: _animation.value,
            icon: Icon(widget.icon),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
