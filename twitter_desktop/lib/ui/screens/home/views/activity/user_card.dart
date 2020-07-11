import 'package:flutter/material.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/components/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required double gap,
  })  : _gap = gap,
        super(key: key);

  final double _gap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(_gap),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('resources/images/user_verified.png'),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 15,
              height: 15,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAvatar(
                userAvatar: 'resources/images/profile_picture.jpg',
                width: 75,
                height: 75,
              ),
              SizedBox(height: 15),
              Text(
                'Eleandro Duzentos',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '@e200',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.room,
                    size: 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text('Luanda, Angola')
                ],
              ),
              SizedBox(height: 35),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Tweets',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text('326'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text('191'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text('101'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
