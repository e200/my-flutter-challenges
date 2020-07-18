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
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
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
          SizedBox(
            height: MediaQuery.of(context).size.height - 220,
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  children: [
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                    ListTile(
                      title: Text('Text'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
