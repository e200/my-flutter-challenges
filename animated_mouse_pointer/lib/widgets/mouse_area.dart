import 'package:animated_mouse_pointer/widgets/mouse_pointer/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MouseArea extends StatelessWidget {
  final _pointerOffsetNotifier = ValueNotifier<Offset>(Offset.infinite);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (value) {
        _pointerOffsetNotifier.value = value.position;
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ValueListenableBuilder<Offset>(
            valueListenable: _pointerOffsetNotifier,
            builder: (context, value, child) {
              return MousePointer(
                radius: 10,
                position: value,
              );
            }
          ),
        ],
      ),
    );
  }
}
