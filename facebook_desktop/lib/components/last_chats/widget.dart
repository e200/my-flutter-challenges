import 'package:facebook_desktop/components/chat_card.dart';
import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LastChats extends StatelessWidget {
  final _faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Section(
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SectionTitle(
          title: 'Last chats',
        ),
      ),
      padding: const EdgeInsets.only(
        left: 30,
        top: 30,
        bottom: 30,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Color(0xFFE6F2FE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            ChatCard(
              image:
                  'https://pbs.twimg.com/profile_images/1095180025668743168/LgPx_hOQ.jpg',
              name: _faker.person.name(),
              message: _faker.lorem.sentence(),
              padding: const EdgeInsets.all(15).copyWith(bottom: 7.5),
            ),
            ChatCard(
              image:
                  'https://images-na.ssl-images-amazon.com/images/M/MV5BNTczMzk1MjU1MV5BMl5BanBnXkFtZTcwNDk2MzAyMg@@._V1_UY256_CR2,0,172,256_AL_.jpg',
              name: _faker.person.name(),
              message: _faker.lorem.sentence(),
              padding: const EdgeInsets.all(15).copyWith(
                top: 7.5,
                bottom: 7.5,
              ),
            ),
            ChatCard(
              image: 'https://i.imgur.com/a2awzVm.jpg',
              name: _faker.person.name(),
              message: _faker.lorem.sentence(),
              padding: const EdgeInsets.all(15).copyWith(
                top: 7.5,
                bottom: 7.5,
              ),
            ),
            ChatCard(
              image: 'https://randomuser.me/api/portraits/men/55.jpg',
              name: _faker.person.name(),
              message: _faker.lorem.sentence(),
              padding: const EdgeInsets.all(15).copyWith(
                top: 7.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
