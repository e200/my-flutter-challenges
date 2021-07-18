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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
                child: Stack(
                  clipBehavior: Clip.none,
                  children: List.generate(
                    5,
                    (index) {
                      return PerspectiveLayer(
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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
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
