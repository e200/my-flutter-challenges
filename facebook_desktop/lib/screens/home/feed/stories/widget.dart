import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:facebook_desktop/screens/home/feed/stories/story.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  Faker _faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Section(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SectionTitle(
          title: 'STORIES',
        ),
      ),
      child: Container(
        height: 280,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 45)
              .copyWith(top: 0),
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Story(
                story: 'https://picsum.photos/id/1005/500/500',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://pbs.twimg.com/profile_images/642171524569427968/z2S0ttIf.jpg',
                story: 'https://picsum.photos/id/184/500/500',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://images.unsplash.com/photo-1508091073125-ced32109d0ee?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
                story: 'https://picsum.photos/id/16/500/500',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://pbs.twimg.com/profile_images/1095180025668743168/LgPx_hOQ.jpg',
                story: 'https://picsum.photos/id/188/500/500',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://images-na.ssl-images-amazon.com/images/M/MV5BMjIyMzgxMzc5N15BMl5BanBnXkFtZTgwNDg3NzYzMDI@._V1_UY256_CR38,0,172,256_AL_.jpg',
                story:
                    'https://i.picsum.photos/id/19/367/267.jpg?hmac=IK27s3JVNjRMGKYhgIrlXjxGTGe9xH3VOG-S-GmXjqY',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=a9135544c8156a1aa2dfd68338ad32f5',
                story:
                    'https://i.picsum.photos/id/2/367/267.jpg?hmac=fg7-2RVTv7Arg3KCcWEorOjdPaC-vJPKTLZgQ7f6R0g',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://randomuser.me/api/portraits/women/16.jpg',
                story:
                    'https://i.picsum.photos/id/21/367/267.jpg?hmac=SVq8gysriUkJTMsfchdWmkBEDC9XWmq35VaBkl5bsVo',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://randomuser.me/api/portraits/men/70.jpg',
                story:
                    'https://picsum.photos/id/200/400/400',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Story(
                name: _faker.person.name(),
                avatar:
                    'https://pbs.twimg.com/profile_images/754232659300065280/Oh_gkODg.jpg',
                story:
                    'https://picsum.photos/id/20/400/400',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
