import 'package:flutter/material.dart';
import 'package:droidknights/pages/track_screen_tab.dart';
import 'package:flutter/cupertino.dart';

class TrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
            bottom: scheduleAppbar()),
        body: TabBarView(
          children: <Widget>[
            new TrackScreenTab('assets/json/schedule_track1.json'),
            new TrackScreenTab('assets/json/schedule_track2.json'),
            new TrackScreenTab('assets/json/schedule_track3.json')
          ],
        ),
      ),
    );
  }

  Widget scheduleAppbar() {
    return new TabBar(
        labelColor: new Color(0xff40d225),
        unselectedLabelColor: Colors.grey,
        indicatorColor: new Color(0xff40d225),
        tabs: <Widget>[
          new Tab(text: "Track1"),
          new Tab(text: "Track2"),
          new Tab(text: "Track3"),
        ]);
  }
}
