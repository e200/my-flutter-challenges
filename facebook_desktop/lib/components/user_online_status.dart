import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserOnlineStatus extends StatelessWidget {
  final bool online;

  const UserOnlineStatus({
    Key key,
    this.online = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
            color: online ? Colors.green : Colors.red,
                blurRadius: 5,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 7.5,
        ),
        Text(
          online ? 'Online' : 'Offline',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
