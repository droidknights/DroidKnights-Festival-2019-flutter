import 'dart:async';

import 'package:flutter/material.dart';
import 'package:droidknights/models/track_schedule.dart';

class SessionDetailPage extends StatefulWidget {
  final ScheduleModel session;

  SessionDetailPage(this.session);

  @override
  _SessionDetailPageState createState() => new _SessionDetailPageState();
}

class _SessionDetailPageState extends State<SessionDetailPage> {
  double avartarSize = 130.0;

  Widget get profileImage {
    return new Hero(
      tag: widget.session,
      child: new Container(
        height: avartarSize,
        width: avartarSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                offset: const Offset(1.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: const Color(0x33000000)),
            const BoxShadow(
                offset: const Offset(2.0, 1.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: const Color(0x24000000)),
            const BoxShadow(
                offset: const Offset(3.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: const Color(0x1F000000)),
          ],
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(widget.session.avatarUrl ?? ''),
          ),
        ),
      ),
    );
  }

  Widget get sessionContents {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.grey[50],
            Colors.grey[50],
            Colors.grey[100],
            Colors.grey[100],
          ],
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileImage,
          new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: new Text(
                widget.session.title,
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              )
          ),
          new Text(
            widget.session.name,
            style: Theme.of(context).textTheme.body1,
          ),
          new Text(
            widget.session.time,
            style: Theme.of(context).textTheme.body2,
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.session.contents.toString(),
                style: new TextStyle(color: Colors.black54)),
          ),
          //rating
        ],
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(' ${widget.session.time}',
            style: Theme.of(context).textTheme.body1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text('${widget.session.title}'),
      ),
      body: new ListView(
        children: <Widget>[
          sessionContents,
          //addYourRating
        ],
      ),
    );
  }
}
