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
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0))
        ],
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new TrackOneScreen(),
            new TrackTwoScreen(),
          ]
      ),
      /*floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.black,
        ),
        onPressed: ()=> print("open chats"),
      ),*/
    );
  }
}