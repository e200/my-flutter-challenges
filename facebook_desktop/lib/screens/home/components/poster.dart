import 'package:facebook_desktop/screens/home/components/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Form(
          child: Column(
            children: [
              /* TextFormField(
                
                decoration:
                    InputDecoration(labelText: 'Your message'),
              ), */
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('PUBLISH'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
