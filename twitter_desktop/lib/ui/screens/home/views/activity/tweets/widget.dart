import 'package:flutter/material.dart';
import 'package:twitter_desktop/ui/components/card.dart';

class Tweets extends StatefulWidget {
  @override
  _TweetsState createState() => _TweetsState();
}

class _TweetsState extends State<Tweets> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text('Tweets & Retweets'),
                  ),
                  Tab(
                    child: Text('Media'),
                  ),
                  Tab(
                    child: Text('Likes'),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Text('a'),
              Text('b'),
              Text('c'),
            ],
          ),
        ),
      ),
    );
  }
}
