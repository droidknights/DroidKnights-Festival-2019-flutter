import 'package:droidknights/models/track_schedule.dart';
import 'package:droidknights/pages/session_detail_dialog.dart';
import 'package:flutter/material.dart';
import 'package:droidknights/models/schedule_service.dart';

class SchedulePage extends StatelessWidget {
  static final int ITEMVIEW_TYPE_NORMAL = 0;
  static final int ITEMVIEW_TYPE_SESSTION = 1;

  List<ScheduleModel> datas;

  Widget scheduleAppbar() {
    return TabBar(
      labelColor: Color(0xff40d225),
      unselectedLabelColor: Colors.grey,
      indicatorColor: Color(0xff40d225),
      tabs: <Widget>[
        Tab(text: "Track1"),
        Tab(text: "Track2"),
        Tab(text: "Track3"),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/dk_appbar_title.png',
            fit: BoxFit.fitHeight,
            height: 25,
          ),
          bottom: scheduleAppbar()
        ),
        body: TabBarView(
          children: <Widget> [
            trackScreen('assets/json/schedule_track1.json'),
            trackScreen('assets/json/schedule_track2.json'),
            trackScreen('assets/json/schedule_track3.json'),
          ],
        )
      )
    );
  }

  Widget trackScreen(String filePath) {

    return FutureBuilder(
      future: loadSchedule(filePath),
      builder: (BuildContext context,
          AsyncSnapshot<List<ScheduleModel>> snapshot) {
        if (!snapshot.hasData) return Container(color: Colors.black);
        datas = snapshot.data;
        return Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, i) =>
              Column(children: <Widget>[_itemView(context, i)])
          ),
        );
      }
     );
  }

  ListTile _itemView(context, i) {
    if (datas[i].type == ITEMVIEW_TYPE_SESSTION) {
      return _showItemSection(context, i);
    } else {
      return _showItemNormal(context, i);
    }
  }

  ListTile _showItemSection(context, i) {
    return ListTile(
      leading: Text(
        datas[i].time,
        style: TextStyle(
            color: Theme.of(context).primaryColorLight, fontSize: 12.0),
      ),
      title: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              const Radius.circular(4.0),
            )
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 28.0,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                datas[i].avatarUrl,
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0)),
            Flexible(
              child: Container(
                height: 60.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      datas[i].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      datas[i].name,
                      style: TextStyle(
                          color: Color(0xffa5b495), fontSize: 12.0),
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
    return ListTile(
      leading: Text(
        datas[i].time,
        style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 12.0),
      ),
      title: Text(
        datas[i].title,
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16.0),
      ),
    );
  }

  showDetailPage(BuildContext context, int i) {
    Navigator.of(context).push(SessionDetailDialog(datas[i]));
  }
}
