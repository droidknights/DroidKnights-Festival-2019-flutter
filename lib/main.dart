import 'package:flutter/material.dart';
import 'package:droidknights/droidknightsapp_home.dart';
import 'bloc/bloc_provider.dart';
import 'bloc/tab_bloc.dart';

void main() => runApp(
  BlocProvider<TabBloc>(
    bloc: TabBloc(),
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "DroidKnights",
      theme: ThemeData(
        primaryColor: Color(0xff000000),
        accentColor: Color(0xff40d225),
        indicatorColor: Color(0xff40d225),
        primaryColorLight: Color(0xff96ce7e)
      ),
      debugShowCheckedModeBanner: false,
      home: DroidknightsAppHome(),
    );
  }
}