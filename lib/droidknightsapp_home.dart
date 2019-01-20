import 'package:droidknights/models/Constants.dart';
import 'package:droidknights/pages/generate_qrcode.dart';
import 'package:droidknights/pages/trackone_screen.dart';
import 'package:droidknights/pages/tracktwo_screen.dart';
import 'package:flutter/material.dart';

class DroidknightsAppHome extends StatefulWidget {
  @override
  _DroidknightsAppHomeState createState() => new _DroidknightsAppHomeState();

}

class _DroidknightsAppHomeState extends State<DroidknightsAppHome>
    with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DroidKnights"),
        elevation: 0.7,
        bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(text: "Track1",),
              new Tab(text: "Track2"),
            ]
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String> (
                  value : choice,
                  child : Text(choice)
                );
              }).toList();
            },
          ),
        ],
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new TrackOneScreen(),
            new TrackTwoScreen(),
          ]
      ),
    );
  }
  
  void _select(String string) {
    if (string == Constants.QRcode) {
      showQRcodePage(context);
    }
    
  }

  showQRcodePage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new GenerateScreen();
    }));
  }
}