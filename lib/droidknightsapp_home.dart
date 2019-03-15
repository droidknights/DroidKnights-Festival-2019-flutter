import 'package:droidknights/pages/info_page.dart';
import 'package:droidknights/pages/schedule_page.dart';
import 'package:droidknights/res/strings.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/tab_bloc.dart';

class DroidknightsAppHome extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _tabBloc = BlocProvider.of<TabBloc>(context);
    return StreamBuilder(
      stream: _tabBloc.$bottomTab,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
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
          ) 
        );
      }
    );
  }

  Widget bodyPages(index) {
    switch (index) {
      case 0 : return InfoPage();
      case 1 : return SchedulePage();
    }
  }
}
