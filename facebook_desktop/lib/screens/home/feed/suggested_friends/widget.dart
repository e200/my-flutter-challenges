import 'package:facebook_desktop/components/friend_card.dart';
import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';

class SuggestedFriends extends StatelessWidget {
  final _faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.only(bottom: 30),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SectionTitle(
          title: 'SUGGESTED FRIENDS',
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FriendCard(
            margin: EdgeInsets.only(top: 15),
            name: _faker.person.name(),
            image:
                'https://images-na.ssl-images-amazon.com/images/M/MV5BMjExOTY3NzExM15BMl5BanBnXkFtZTgwOTg1OTAzMTE@._V1_UX172_CR0,0,172,256_AL_.jpg',
            online: false,
          ),
        ],
      ),
    );
  }
}
