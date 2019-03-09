import 'package:droidknights/models/track_schedule.dart';
import 'package:droidknights/pages/session_detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:droidknights/models/schedule_service.dart';

class TrackOneScreen extends StatefulWidget {
  @override
  TrackOneScreenState createState() {
    return new TrackOneScreenState();
  }
}

class TrackOneScreenState extends State<TrackOneScreen> {
  List<ScheduleModel> datas;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new FutureBuilder(
            future: loadSchedule(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ScheduleModel>> snapshot) {
              if (!snapshot.hasData) return new Container();
              datas = snapshot.data;
              return new Container(
                color: Colors.black,
                child: new ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, i) => _itemView(context, i),
                ),
              );
            }
            )
    );
  }

  Column _itemView(context, i) {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: new Text(
            datas[i].time,
            style: new TextStyle(color: Colors.green[300], fontSize: 12.0),
          ),
          title: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(
                    const Radius.circular(4.0),
                )
            ),
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleAvatar(
                  maxRadius: 28.0,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(
                      datas[i].avatarUrl,
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0)),
                new Flexible(
                  child: new Container(
                    height: 80.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          datas[i].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Text(
                          datas[i].name,
                          style: new TextStyle(color: Colors.green[200], fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*subtitle: new Container(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: new Row(
                children: <Widget>[
                  new Text(
                    datas[i].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0)),
                  new Text(
                    datas[i].name,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ],
              )
          ),*/
          onTap: () => showDetailPage(context, i),
        ),
      ],
    );
  }

  _getScheduleData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/schedule_track1.json");
    final jsonResult = json.decode(data);
    print(jsonResult);
  }

  showDetailPage(BuildContext context, int i) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SessionDetailPage(datas[i]);
    }));
  }
}
