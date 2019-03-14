import 'package:droidknights/pages/track_screen.dart';
import 'package:flutter/material.dart';
import 'package:droidknights/pages/info_page.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

class DroidknightsAppHome extends StatefulWidget {
  @override
  _DroidknightsAppHomeState createState() => new _DroidknightsAppHomeState();
}

class _DroidknightsAppHomeState extends State<DroidknightsAppHome>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  List<Widget> _children = [
    InfoPage(),
    TrackScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? createAndroidWidget(context)
    : createIosWidget(context);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget createAndroidWidget(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        body: _children[_currentIndex]);
  }

  Widget createIosWidget(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor:  const Color(0xFF112030),
      tabBar: iosNavigationBar(),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return _children[0];
                break;
              case 1:
                return _children[1];
                break;
              default:
                return Center(child: Text("DEFAULT"));
            }
          },
        );
      },
    );
  }

  Widget iosNavigationBar() => CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            title: Text('Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            title: Text('Schedule'),
          ),
        ],
      );



  Widget bottomNavigationBar() =>
      new BottomNavigationBar(onTap: onTabTapped, currentIndex: _currentIndex,
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.info),
              title: new Text('Info'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.schedule),
              title: new Text('Schedule'),
            ),
          ]);
}
