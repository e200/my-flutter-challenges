import 'package:flutter/material.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons({
    Key key,
  }) : super(key: key);

  @override
  _PlayerButtonsState createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  bool _isPlaying = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            Icons.skip_previous,
            color: Color(0xFF303846),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isPlaying = !_isPlaying;

              if (_isPlaying) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF1F2631),
              borderRadius: BorderRadius.circular(100),
            ),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animation,
              size: 28,
              color: Color(0xFFC4C1C2),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            Icons.skip_next,
            color: Color(0xFF303846),
          ),
        ),
      ],
    );
  }
}
