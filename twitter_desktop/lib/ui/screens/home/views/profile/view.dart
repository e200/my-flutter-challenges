import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/ui/components/card.dart';
import 'package:twitter_desktop/ui/screens/home/views/profile/tweets/widget.dart';
import 'package:twitter_desktop/ui/screens/home/views/profile/user_card.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ScrollController _customScrollViewController;
  ScrollController _singleChildScrollViewController;

  final _sliverAppBarExpandedHeight = 280.0;
  final _gap = 20.0;

  @override
  void initState() {
    _customScrollViewController = ScrollController();
    _singleChildScrollViewController = ScrollController();

    _singleChildScrollViewController.addListener(() {
      if (_singleChildScrollViewController.offset <
          _sliverAppBarExpandedHeight) {
        _customScrollViewController
            .jumpTo(_singleChildScrollViewController.offset);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          Duration(seconds: 1),
        );
      },
      child: Stack(
        children: [
          CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _customScrollViewController,
            slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight: _sliverAppBarExpandedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'resources/images/cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverFillRemaining(),
            ],
          ),
          SingleChildScrollView(
            controller: _singleChildScrollViewController,
            child: Container(
              margin: EdgeInsets.only(top: _sliverAppBarExpandedHeight - 40),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                child: SizedBox(
                  width: 1024,
                  height: MediaQuery.of(context).size.height - 130,
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            UserCard(gap: _gap),
                            SizedBox(
                              height: 15,
                            ),
                            ProfileItems(),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            ProfileTweets()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItems extends StatelessWidget {
  final _cardHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ActivityItem(
                  label: 'Activities',
                  icon: FeatherIcons.eye,
                  height: _cardHeight,
                  isSelected: true,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: ActivityItem(
                  label: 'Moments',
                  icon: FeatherIcons.zap,
                  height: _cardHeight,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ActivityItem(
                  label: 'Friends',
                  icon: FeatherIcons.users,
                  height: _cardHeight,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: ActivityItem(
                  label: 'Edit profile',
                  icon: FeatherIcons.settings,
                  height: _cardHeight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final double height;
  final bool isSelected;

  ActivityItem({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.height,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AppCard(
        height: height,
        style: isSelected ? AppCardStyle.Normal : AppCardStyle.Outlined,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Theme.of(context).primaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
