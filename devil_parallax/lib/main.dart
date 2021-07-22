import 'package:flutter/material.dart';

void main() {
  runApp(ParallaxDevilApp());
}

class ParallaxDevilApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Devil',
      home: ParallaxDevil(),
    );
  }
}

class ParallaxDevil extends StatefulWidget {
  ParallaxDevil({Key? key}) : super(key: key);

  @override
  _ParallaxDevilState createState() => _ParallaxDevilState();
}

class _ParallaxDevilState extends State<ParallaxDevil>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  late Tween<Offset> _offsetTween;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _offsetAnimationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.ease),
    );

    _offsetAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offsetTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(parent: _offsetAnimationController, curve: Curves.ease),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
    _offsetAnimationController.dispose();
  }

  Offset getPerspectivePointer(Offset offset) {
    final _size = MediaQuery.of(context).size;

    final _screenWidth = _size.width;
    final _screenHeight = _size.height;
    final _centerX = _screenWidth / 2;
    final _centerY = _screenHeight / 2;

    final _perspectivePointer = Offset(
      (_centerX - offset.dx) / 2,
      -((_centerY - offset.dy) / 2),
    );

    return _perspectivePointer;
  }
            _offsetTween.begin = _offsetTween.end;
            _animationController.duration = Duration.zero;
            _animationController.reset();

            _offsetTween.end = _perspectivePointer;
            _animationController.forward();
          },
          onExit: (event) {
            _offsetTween.begin = _offsetTween.end;
            _animationController.reset();

            _offsetTween.end = Offset.zero;
            _animationController.duration = const Duration(milliseconds: 500);
            _animationController.forward();
          },
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                final value = _animation.value;

                return Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateY(0.0003 * value.dy)
                    ..rotateX(0.0003 * value.dx),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 1024,
                      maxHeight: 576,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: List.generate(
                        5,
                        (index) {
                          return PerspectiveLayer(
                            offset: Offset(
                              (index * .03) * value.dx,
                              (index * .08) * value.dy,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage('assets/$index.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PerspectiveLayer extends StatelessWidget {
  final String imageSrc;
  final Offset offset;

  const PerspectiveLayer({
    Key? key,
    required this.imageSrc,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(imageSrc),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
