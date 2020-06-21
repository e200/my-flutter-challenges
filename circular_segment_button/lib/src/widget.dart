import 'package:circular_segment_button/src/paint.dart';
import 'package:circular_segment_button/src/segment.dart';
import 'package:flutter/widgets.dart';

class CircularSegmentButton extends StatelessWidget {
  final List<Segment> segments;

  const CircularSegmentButton({
    Key key,
    this.segments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CircularSegmentPaint(),
      ),
    );
  }
}
