import 'package:droidknights/pages/info_ios_page.dart';
import 'package:droidknights/pages/info_page.dart';
import 'package:droidknights/pages/schedule_page.dart';
import 'package:droidknights/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;


class DroidknightsAppHome extends StatefulWidget {
  @override
  _DroidknightsAppHomeState createState() => _DroidknightsAppHomeState();
}

class _DroidknightsAppHomeState extends State<DroidknightsAppHome> {

  int _index = 0;
  List<Widget> _pages = [Platform.isAndroid ? InfoPage() : InfoIosPage(), SchedulePage()];

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? createAndroidWidget() : createIosWidget();
  }

  Widget createAndroidWidget() {

    return Scaffold(
        body: bodyPages(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => {
            setState(() {
              _index = index;
            })
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text(Strings.INFO_TAB),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              title: Text(Strings.SCHEDULE_TAB),
            ),
          ],
        ));
  }

  Widget bodyPages() {
    return  new Stack(
      children: <Widget>[
        new Offstage(
          offstage: _index != 0,
          child: new TickerMode(
            enabled: _index == 0,
            child: _pages[0],
          ),
        ),
        new Offstage(
          offstage: _index != 1,
          child: new TickerMode(
            enabled: _index == 1,
            child: _pages[1],
          ),
        ),
      ],
    );
  }

  Widget createIosWidget() {
    return CupertinoTabScaffold(
      backgroundColor: const Color(0xFF112030),
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            title: Text(Strings.INFO_TAB),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            title: Text(Strings.SCHEDULE_TAB),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return bodyPages();
          },
        );
      },
    );
  }
}
