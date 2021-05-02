import 'package:flutter/material.dart';

import 'macbook.dart';

final List<MacbookColorScheme> _macbookColors = [
  MacbookColorScheme(
    name: 'Rose Gold',
    primary: Color(0xFFF8CDBC),
    trackpadBorderColor: Color(0xFFA87961),
  ),
  MacbookColorScheme(
    name: 'Silver',
    primary: Color(0xFFEBECEF),
    trackpadBorderColor: Color(0xFF929395),
  ),
  MacbookColorScheme(
    name: 'Gold',
    primary: Color(0xFFFAE0CB),
    trackpadBorderColor: Color(0xFFB28975),
  ),
  MacbookColorScheme(
    name: 'Space Grey',
    primary: Color(0xFFABA7AE),
    trackpadBorderColor: Color(0xFF84858A),
  ),
];

void main() {
  runApp(MacbookKeyboardApp());
}

class MacbookKeyboardApp extends StatefulWidget {
  static final appTitle = 'Macbook Keyboard';

  @override
  _MacbookKeyboardAppState createState() => _MacbookKeyboardAppState();
}

class _MacbookKeyboardAppState extends State<MacbookKeyboardApp> {
  MacbookColorScheme macbookColorScheme;

  double scale = 1;

  @override
  void initState() {
    super.initState();

    macbookColorScheme = _macbookColors.first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MacbookKeyboardApp.appTitle,
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Center(
                child: Transform.scale(
                  scale: scale,
                  child: Macbook(colorScheme: macbookColorScheme),
                ),
              ),
            ),
            _MacbookColorSchemeSelector(
              onChanged: (colorScheme) {
                setState(() {
                  macbookColorScheme = colorScheme;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: _MacbookScaleSlider(
                value: scale,
                onChanged: (value) {
                  setState(() {
                    scale = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _MacbookScaleSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _MacbookScaleSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: RotatedBox(
        quarterTurns: 3,
        child: Slider.adaptive(
          inactiveColor: Colors.grey.shade300,
          activeColor: Colors.grey.shade300,
          min: .8,
          max: 1.2,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _MacbookColorSchemeSelector extends StatelessWidget {
  final ValueChanged<MacbookColorScheme> onChanged;

  const _MacbookColorSchemeSelector({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _macbookColors.length,
        (index) {
          final _colorScheme = _macbookColors[index];

          return InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              onChanged(_colorScheme);
            },
            child: SizedBox(
              width: 150,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Colors.black.withOpacity(.1),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: _colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    _colorScheme.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
