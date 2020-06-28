import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Poster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SectionTitle(
          title: 'NEW POST',
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Container(
        padding: const EdgeInsets.all(15).copyWith(top: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.grey.withOpacity(.6),
                  icon: Icon(FeatherIcons.image),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.grey.withOpacity(.6),
                  icon: Icon(FeatherIcons.video),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.grey.withOpacity(.6),
                  icon: Icon(FeatherIcons.music),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.grey.withOpacity(.6),
                  icon: Icon(FeatherIcons.mapPin),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.grey.withOpacity(.6),
                  icon: Icon(FeatherIcons.file),
                  onPressed: () {},
                ),
              ],
            ),
            TextFormField(
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                labelText: 'What are you thinking...',
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.blue.withOpacity(.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blue.withOpacity(.6),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(.2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue.withOpacity(.6),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'PUBLISH',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue.withOpacity(.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
