import 'package:facebook_desktop/components/friend_card.dart';
import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class YourFriends extends StatelessWidget {
  final _faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.only(bottom: 30),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SectionTitle(
          title: 'YOUR FRIENDS',
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FriendCard(
            margin: EdgeInsets.only(top: 7.5),
            name: _faker.person.name(),
            image:
                'https://pbs.twimg.com/profile_images/913492942408609792/8Q-zGQuK.jpg',
            online: true,
          ),
          FriendCard(
            margin: EdgeInsets.only(top: 15),
            name: _faker.person.name(),
            image:
                'https://images-na.ssl-images-amazon.com/images/M/MV5BMjExOTY3NzExM15BMl5BanBnXkFtZTgwOTg1OTAzMTE@._V1_UX172_CR0,0,172,256_AL_.jpg',
            online: true,
          ),
          FriendCard(
            margin: EdgeInsets.only(top: 15),
            name: _faker.person.name(),
            image:
                'https://images-na.ssl-images-amazon.com/images/M/MV5BODM5NzU4MTI4OF5BMl5BanBnXkFtZTgwNDczMDU5ODE@._V1_UX172_CR0,0,172,256_AL_.jpg',
            online: true,
          ),
          FriendCard(
            margin: EdgeInsets.only(top: 15),
            name: _faker.person.name(),
            image:
                'https://images.unsplash.com/photo-1476956207128-beccf17c1771?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=52bbdebca6084fffac43984574db3038',
            online: false,
          ),
        ],
      ),
    );
  }
}
