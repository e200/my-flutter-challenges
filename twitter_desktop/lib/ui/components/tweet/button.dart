import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TweetBottomButton extends StatefulWidget {
  final Widget icon;
  final Color color;
  final int value;
  final Function onTap;

  const TweetBottomButton({
    Key key,
    this.icon,
    this.color,
    this.value,
    this.onTap,
  }) : super(key: key);

  @override
  _TweetBottomButtonState createState() => _TweetBottomButtonState();
}

class _TweetBottomButtonState extends State<TweetBottomButton> {
  EzAnimation _scaleAnimation;

  @override
  void initState() {
    _scaleAnimation = EzAnimation.sequence([
      SequenceItem(1.0, 0.0),
      SequenceItem(0.0, 1.0),
    ], Duration(milliseconds: 150));

    _scaleAnimation.addListener(() {
      setState(() {});
    });

    _scaleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleAnimation.reset();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();

        _scaleAnimation.start();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: Theme.of(context)
                      .iconTheme
                      .copyWith(size: 20, color: widget.color)),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: widget.icon,
              ),
            ),
            if (widget.value != null && widget.value > 0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(widget.value.toString()),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
