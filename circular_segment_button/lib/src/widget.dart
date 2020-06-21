import 'package:circular_segment_button/src/paint.dart';
import 'package:circular_segment_button/src/segment.dart';
import 'package:flutter/widgets.dart';

class CircularSegmentButton extends StatelessWidget {
  final List<Segment> segments;
  final double gap;
  final double width;
  final double height;

  const CircularSegmentButton({
    Key key,
    this.segments,
    this.gap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(
          width,
          height,
        ),
        painter: CircularSegmentPaint(
          gap: gap,
          segments: segments,
        ),
      ),
    );
  }
}
