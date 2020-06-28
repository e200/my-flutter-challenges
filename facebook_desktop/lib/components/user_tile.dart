
import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String image;
  final Widget trailing;

  const UserTile({
    Key key,
    this.name,
    this.image,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: name,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '12 min ago',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        if (trailing != null)
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: trailing
          ),
        ),
      ],
    );
  }
}
