import 'package:droidknights/pages/info_ios_page.dart';
import 'package:droidknights/pages/info_page.dart';
import 'package:droidknights/pages/schedule_page.dart';
import 'package:droidknights/res/strings.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class DroidknightsAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tabBloc = BlocProvider.of<TabBloc>(context);
    return StreamBuilder(
        stream: _tabBloc.$bottomTab,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return Platform.isAndroid
              ? createAndroidWidget(_tabBloc, snapshot)
              : createIosWidget();
        });
  }

  Widget createAndroidWidget(TabBloc _tabBloc, var snapshot) {
    return Scaffold(
        body: bodyPages(snapshot.data),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => _tabBloc.changeBottomTab(index),
          currentIndex: snapshot.data,
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

  Widget bodyPages(index) {
    switch (index) {
      case 0:
        return Platform.isAndroid ? InfoPage() : InfoIosPage();
      case 1:
        return SchedulePage();
    }
    return null;
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
            return bodyPages(index);
          },
        );
      },
    );
  }
}
