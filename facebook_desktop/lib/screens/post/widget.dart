import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Hero(
              tag: 'post-hero',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://res.cloudinary.com/practicaldev/image/fetch/s--EPQDBC2W--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://cdn-images-1.medium.com/max/1600/1%2AMGZ23iwd1nuouibCC-_-xg.jpeg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
