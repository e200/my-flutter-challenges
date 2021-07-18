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

class ParallaxDevil extends StatelessWidget {
  ParallaxDevil({Key? key}) : super(key: key);

  final _localOffsetNotifier = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onHover: (event) {
            final _screenWidth = MediaQuery.of(context).size.width;
            final _screenHeight = MediaQuery.of(context).size.height;
            final _centerX = _screenWidth / 2;
            final _centerY = _screenHeight / 2;

            _localOffsetNotifier.value = Offset(
              (_centerX - event.position.dx) / 2,
              -((_centerY - event.position.dy) / 2),
            );
          },
          onExit: (event) {
            _localOffsetNotifier.value = Offset.zero;
          },
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: ValueListenableBuilder(
              valueListenable: _localOffsetNotifier,
              builder: (context, Offset value, _) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1024,
                    maxHeight: 576,
                  ),
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateY(0.0003 * value.dy)
                      ..rotateX(0.0003 * value.dx),
                          borderRadius: BorderRadius.circular(30),
                          offset: Offset(
                            (index * .03) * value.dx,
                            (index * .08) * value.dy,
                          ),
                          child: Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.002)
                              ..rotateY(0.0003 * value.dy)
                              ..rotateX(0.0003 * value.dx),
                            child: Image.asset(
                              'assets/$index.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                        ),
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
  final BorderRadius? borderRadius;
  final Offset offset;
  final Widget child;

  const PerspectiveLayer({
    Key? key,
    this.borderRadius,
    required this.offset,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: child,
    );
  }
}
