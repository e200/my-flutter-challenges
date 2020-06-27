import 'package:flutter/material.dart';

class LeftBarButton extends StatelessWidget {
  final IconData icon;
  final String badge;

  const LeftBarButton({
    Key key,
    this.icon,
    this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: Colors.grey.withOpacity(.6),
            ),
          ),
          if (badge != null)
            Positioned(
              top: 5,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
