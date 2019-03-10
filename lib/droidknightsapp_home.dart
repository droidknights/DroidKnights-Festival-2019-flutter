import 'package:droidknights/pages/track_screen.dart';
import 'package:flutter/material.dart';
import 'package:droidknights/pages/info_page.dart';

class DroidknightsAppHome extends StatefulWidget {
  @override
  _DroidknightsAppHomeState createState() => new _DroidknightsAppHomeState();
}

class _DroidknightsAppHomeState extends State<DroidknightsAppHome>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  List<Widget> _appbar = [];
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    _appbar.addAll([null, scheduleAppbar()]);
    _children.addAll([
      InfoPage(),
      //PlaceholderWidget(Colors.deepOrange),
      scheduleBody()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/dk_appbar_title.png',
                  fit: BoxFit.contain,
                  height: 25,
                )
              ],
            ),
            elevation: 0.7,
            bottom: _appbar[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
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
          ],
        ),
        body: _children[_currentIndex]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget scheduleAppbar() {
    return new TabBar(
        controller: _tabController,
        labelColor: new Color(0xff40d225),
        unselectedLabelColor: Colors.grey,
        indicatorColor: new Color(0xff40d225),
        tabs: <Widget>[
          new Tab(text: "Track1"),
          new Tab(text: "Track2"),
          new Tab(text: "Track3"),
        ]);
  }

  Widget scheduleBody() {
    return new Scaffold(
      body: new TabBarView(controller: _tabController, children: <Widget>[
        new TrackScreen('assets/json/schedule_track1.json'),
        new TrackScreen('assets/json/schedule_track2.json'),
        new TrackScreen('assets/json/schedule_track3.json')
      ]),
    );
  }
}
