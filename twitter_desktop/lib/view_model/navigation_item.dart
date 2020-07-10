import 'package:flutter/widgets.dart';

class NavigationItem {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function onTap;

  NavigationItem({
    this.icon,
    this.label,
    this.onTap,
    this.isSelected = false,
  });
}
