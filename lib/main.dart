import 'package:flutter/material.dart';
import 'package:droidknights/droidknightsapp_home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "DroidKnights",
      theme: new ThemeData(
          primaryColor: new Color(0xff000000),
          accentColor: new Color(0xff40d225),
          indicatorColor: new Color(0xff40d225),
          primaryColorLight: new Color(0xff96ce7e)
      ),
      debugShowCheckedModeBanner: false,
      home: new DroidknightsAppHome(),
    );
  }
}