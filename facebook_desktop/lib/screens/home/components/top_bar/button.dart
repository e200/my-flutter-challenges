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
    this.isActive = false,
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
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Icon(
                  widget.icon,
                  color: _animation.value,
                ),
              ),
              Positioned(
                bottom: -1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 50),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: _animation.value,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: _animation.value,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    width: widget.isActive ? 50 : 0,
                    height: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
