import 'package:flutter/material.dart';
import 'package:droidknights/models/schedule_service.dart';
import 'package:droidknights/models/track_schedule.dart';
import 'package:droidknights/pages/session_detail_dialog.dart';

class TrackScreenTab extends StatefulWidget {
  final String filePath;
  TrackScreenTab(this.filePath);
  @override
  _TrackScreenTabState createState() => _TrackScreenTabState();
}

class _TrackScreenTabState extends State<TrackScreenTab> {
  static final int ITEMVIEW_TYPE_NORMAL = 0;
  static final int ITEMVIEW_TYPE_SESSTION = 1;

  List<ScheduleModel> datas;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new FutureBuilder(
            future: loadSchedule(widget.filePath),
            builder: (BuildContext context,
                AsyncSnapshot<List<ScheduleModel>> snapshot) {
              if (!snapshot.hasData) return new Container(color: Colors.black);
              datas = snapshot.data;
              return new Container(
                color: Colors.black,
                child: new ListView.builder(
                    itemCount: datas.length,
                    itemBuilder: (context, i) =>
                        new Column(children: <Widget>[_itemView(context, i)])),
              );
            }));
  }

  ListTile _itemView(context, i) {
    if (datas[i].type == ITEMVIEW_TYPE_SESSTION) {
      return _showItemSection(context, i);
    } else {
      return _showItemNormal(context, i);
    }
  }

  ListTile _showItemSection(context, i) {
    return new ListTile(
      leading: new Text(
        datas[i].time,
        style: new TextStyle(
            color: Theme.of(context).primaryColorLight, fontSize: 12.0),
      ),
      title: new Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              const Radius.circular(4.0),
            )),
        padding: const EdgeInsets.all(12.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new CircleAvatar(
              maxRadius: 28.0,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: datas[i].avatarUrl == ""
                  ? new Image.asset('assets/images/dk_profile.png').image
                  : new NetworkImage(
                      datas[i].avatarUrl,
                    ),
            ),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0)),
            new Flexible(
              child: new Container(
                constraints: BoxConstraints(minHeight: 60.0),
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
                      style: new TextStyle(
                          color: new Color(0xffa5b495), fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => showDetailPage(context, i),
    );
  }

  ListTile _showItemNormal(context, i) {
    return new ListTile(
      leading: new Text(
        datas[i].time,
        style: new TextStyle(
            color: Theme.of(context).primaryColorLight, fontSize: 12.0),
      ),
      title: new Text(
        datas[i].title,
        style:
            new TextStyle(color: Theme.of(context).accentColor, fontSize: 16.0),
      ),
    );
  }

  showDetailPage(BuildContext context, int i) {
    Navigator.of(context).push(SessionDetailDialog(datas[i]));
  }
}
