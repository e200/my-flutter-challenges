import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mdi/mdi.dart';
import 'package:twitter_desktop/ui/components/card.dart';

class ActivityView extends StatefulWidget {
  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'resources/images/cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width - 260,
                child: Align(
                  child: SizedBox(
                    width: 768,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            AppCard(
                              padding: EdgeInsets.all(20),
                              child: Stack(
                                children: [
                                  Icon(
                                    Mdi.check,
                                    color: Theme.of(context).primaryColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(),
                        Column(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
