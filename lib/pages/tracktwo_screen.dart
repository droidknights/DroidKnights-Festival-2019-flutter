import 'package:droidknights/models/track_schedule.dart';
import 'package:droidknights/pages/session_detail_page.dart';
import 'package:flutter/material.dart';

class TrackTwoScreen extends StatefulWidget{
  @override
  TrackTwoScreenState createState() {
    return new TrackTwoScreenState();
  }
}

class TrackTwoScreenState extends State<TrackTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 10.0,
          ),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    child: new Text(
                      dummyData[i].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: new Container(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      dummyData[i].name,
                      style:
                      new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                    new Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5.0)),
                    new Text(
                      dummyData[i].time,
                      style:
                      new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                )
            ),
            onTap: () => showDetailPage(context, i),
          ),
        ],
      ),
    );
  }

  showDetailPage(BuildContext context, int i) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SessionDetailPage(dummyData[i]);
    }));
  }
}