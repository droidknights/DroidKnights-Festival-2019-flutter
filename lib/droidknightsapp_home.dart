import 'package:droidknights/models/Constants.dart';
import 'package:droidknights/pages/generate_qrcode.dart';
import 'package:droidknights/pages/scan_qrcode.dart';
import 'package:droidknights/pages/trackone_screen.dart';
import 'package:droidknights/pages/tracktwo_screen.dart';
import 'package:droidknights/placeholder_widget.dart';
import 'package:flutter/material.dart';

class DroidknightsAppHome extends StatefulWidget {
  @override
  _DroidknightsAppHomeState createState() => new _DroidknightsAppHomeState();
}

class _DroidknightsAppHomeState extends State<DroidknightsAppHome>
    with TickerProviderStateMixin {
  TabController _tabController;
  TabController _profile_tabController;
  int _currentIndex = 1;
  List<Widget> _appbar = [];
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    _profile_tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    _appbar.addAll([null, scheduleAppbar(), profileAppbar()]);
    _children.addAll([
      PlaceholderWidget(Colors.deepOrange),
      scheduleBody(),
      profileBody()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("DroidKnights"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                      value: choice, child: Text(choice));
                }).toList();
              },
            ),
          ],
          elevation: 0.7,
          bottom: _appbar[_currentIndex]
        ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ],
        ),
        body: _children[_currentIndex]
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _select(String string) {
    if (string == Constants.MakeQR) {
      showMakeQRcodePage(context);
    } else if (string == Constants.ReadQR) {
      showReadQRcodePage(context);
    }
  }

  showMakeQRcodePage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new GenerateScreen();
    }));
  }

  showReadQRcodePage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new ScanScreen();
    }));
  }

  Widget scheduleAppbar() {
    return new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(
                text: "Track1",
              ),
              new Tab(text: "Track2"),
            ]);
  }

  Widget scheduleBody() {
    return new Scaffold(
      body: new TabBarView(controller: _tabController, children: <Widget>[
        new TrackOneScreen(),
        new TrackTwoScreen(),
      ]),
    );
  }

  Widget profileAppbar() {
    return new TabBar(
        controller: _profile_tabController,
        indicatorColor: Colors.white,
        tabs: <Widget>[
          new Tab(
            text: "Level",
          ),
          new Tab(text: "QRCode"),
          new Tab(text: "Scan"),
        ]);
  }

  Widget profileBody() {
    return new Scaffold(
      body: new TabBarView(controller: _profile_tabController, children: <Widget>[
        PlaceholderWidget(Colors.greenAccent),
        new GenerateScreen(),
        new ScanScreen(),
      ]),
    );
  }
}
