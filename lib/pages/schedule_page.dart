import 'dart:io' show Platform;

import 'package:droidknights/bloc/schedule_like_bloc.dart';
import 'package:droidknights/models/schedule_service.dart';
import 'package:droidknights/models/track_schedule.dart';
import 'package:droidknights/pages/session_detail_dialog.dart';
import 'package:droidknights/res/strings.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  static final int ITEMVIEW_TYPE_NORMAL = 0;
  static final int ITEMVIEW_TYPE_SESSTION = 1;
  final ScheduleLikeBloc _likeBloc = new ScheduleLikeBloc();

  Widget scheduleAppbar() {
    return SliverAppBar(
      centerTitle: true,
      title: Platform.isAndroid ? androidAppBarTitle() : iosAppBarTitle(),
      pinned: true,
      floating: true,
      bottom: TabBar(
        labelColor: Color(0xff40d225),
        unselectedLabelColor: Colors.grey,
        indicatorColor: Color(0xff40d225),
        tabs: <Widget>[
          Tab(text: Strings.SCHEDULE_TAB_TRACK1),
          Tab(text: Strings.SCHEDULE_TAB_TRACK2),
          Tab(text: Strings.SCHEDULE_TAB_TRACK3),
        ],
      ),
    );
  }

  Widget androidAppBarTitle() => Image.asset(
        Strings.SCHEDULE_TAB_IMAGES_APP_BAR,
        fit: BoxFit.fitHeight,
        height: 25,
      );

  Widget iosAppBarTitle() => Text(
        Strings.SCHEDULE_TAB_APPBAR_TITLE,
        style: new TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
                      scheduleAppbar(),
                    ],
            body: TabBarView(
              children: <Widget>[
                trackScreen(Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN1),
                trackScreen(Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN2),
                trackScreen(Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN3),
              ],
            ),
          ),
        ));
  }

  Widget trackScreen(String filePath) {
    return FutureBuilder(
        future: loadSchedule(filePath),
        builder: (BuildContext context,
            AsyncSnapshot<List<ScheduleModel>> snapshot) {
          if (!snapshot.hasData) return Container(color: Colors.black);
          return Container(
            color: Colors.black,
            child: ListView.builder(
                padding: new EdgeInsets.only(bottom: 30),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) => Column(
                    children: <Widget>[_itemView(context, snapshot.data[i])])),
          );
        });
  }

  Widget _itemView(context, data) {
    return StreamBuilder(
        stream: _likeBloc.$likeMap,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return data.type == ITEMVIEW_TYPE_SESSTION
              ? _showItemSection(
                  context,
                  data,
                  snapshot.data[_likeBloc.toBase64(data.title + data.time)] ==
                          null
                      ? false
                      : snapshot
                          .data[_likeBloc.toBase64(data.title + data.time)])
              : _showItemNormal(context, data);
        });
  }

  Widget _showItemSection(context, data, liked) {
    return ListTile(
      leading: Text(
        data.time,
        style: TextStyle(
            color: Theme.of(context).primaryColorLight, fontSize: 12.0),
      ),
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(
            const Radius.circular(4.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE9EEF6),
              blurRadius: 4.0,
              offset: Offset(0, 2.0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(color: Colors.grey, width: 1)),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  width: 56.0,
                  height: 56.0,
                  fadeInDuration: const Duration(seconds: 0),
                  fadeOutDuration: const Duration(seconds: 0),
                  image: data.avatarUrls.first,
                  placeholder: Platform.isAndroid
                      ? Strings.IMAGES_DK_PROFILE
                      : Strings.IMAGES_DK_IOS_PROFILE,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0)),
            Expanded(
              child: Container(
                constraints: BoxConstraints(minHeight: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      data.names.join(", "),
                      style:
                          TextStyle(color: Color(0xffa5b495), fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  liked
                      ? _likeBloc.removeLike(data.title + data.time)
                      : _likeBloc.addLike(data.title + data.time);
                })
          ],
        ),
      ),
      onTap: () => showDetailPage(context, data),
    );
  }

  Widget _showItemNormal(context, data) {
    return ListTile(
      leading: Text(
        data.time,
        style: TextStyle(
            color: Theme.of(context).primaryColorLight, fontSize: 12.0),
      ),
      title: Text(
        data.title,
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16.0),
      ),
    );
  }

  showDetailPage(BuildContext context, data) {
    Navigator.of(context).push(SessionDetailDialog(data));
  }
}
