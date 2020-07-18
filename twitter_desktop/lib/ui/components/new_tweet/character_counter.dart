
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CharacterCounter extends StatefulWidget {
  final int min;
  final int value;

  const CharacterCounter({
    Key key,
    this.min,
    this.value,
  }) : super(key: key);

  @override
  _CharacterCounterState createState() => _CharacterCounterState();
}

class _CharacterCounterState extends State<CharacterCounter> {
  @override
  Widget build(BuildContext context) {
    final _min = widget.min;
    final _value = widget.value;
    final _percentage = _value / _min;

    return CircularPercentIndicator(
      radius: 25,
      lineWidth: 3,
      progressColor: _tweetCharsCountExceeded
          ? Colors.red
          : Theme.of(context).primaryColor,
      percent: _percentage > 1 ? 1 : _percentage,
      center: Visibility(
        visible: _tweetCharsCountExceeded,
        child: Text(
          ((_min - _value) * -1).toString(),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  bool get _tweetCharsCountExceeded => widget.value > widget.min;
}
