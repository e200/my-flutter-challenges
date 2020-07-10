import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class NavigationBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final EdgeInsets padding;
  final Function onTap;
  final bool isSelected;

  const NavigationBarItem({
    Key key,
    this.icon,
    this.label,
    this.padding,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {},
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding: padding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icon,
                    if (label != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 20),
                          Flexible(
                            child: Text(label),
                          ),
                        ],
                      )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: isSelected,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                      width: 2,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
