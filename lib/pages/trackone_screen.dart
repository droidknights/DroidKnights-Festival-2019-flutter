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
            builder: (BuildContext context, AsyncSnapshot<List<ScheduleModel>> snapshot) {
              if (!snapshot.hasData)
                return new Container();
              datas = snapshot.data;
              return new ListView.builder(
                itemCount: datas.length,
                itemBuilder: (context, i) =>
                new Column(
                  children: <Widget>[
                    new Divider(
                      height: 10.0,
                    ),
                    new ListTile(
                      leading: new CircleAvatar(
                        foregroundColor: Theme
                            .of(context)
                            .primaryColor,
                        backgroundColor: Colors.grey,
                        backgroundImage: new NetworkImage(datas[i].avatarUrl),
                      ),
                      title: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Flexible(
                            child: new Container(
                              child: new Text(
                                datas[i].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                datas[i].name,
                                style:
                                new TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                              new Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0)),
                              new Text(
                                datas[i].time,
                                style:
                                new TextStyle(
                                    color: Colors.grey, fontSize: 14.0),
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
        )
    );
  }

  _getScheduleData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/json/schedule_track1.json");
    final jsonResult = json.decode(data);
    print(jsonResult);
  }

  showDetailPage(BuildContext context, int i) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SessionDetailPage(datas[i]);
    }));
  }
}
