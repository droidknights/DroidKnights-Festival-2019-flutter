import 'package:droidknights/const/route.dart';
import 'package:droidknights/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:droidknights/droidknightsapp_home.dart';
import 'package:droidknights/res/strings.dart';

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
      title: Strings.DROID_KNIGHTS,
      theme: ThemeData(
        primaryColor: Color(0xff000000),
        accentColor: Color(0xff40d225),
        indicatorColor: Color(0xff40d225),
        primaryColorLight: Color(0xff96ce7e),
        fontFamily: 'DungGeunMo',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.SPLASH: (_) => new SplashScreen(),
        Routes.HOME: (_) => new DroidknightsAppHome(),
      }
      /*initialRoute: "/splash",
      home: DroidknightsAppHome(),
       routes: <String, WidgetBuilder> {
          "/splash": (BuildContext context) => SplashScreen(),
        },*/
    );
  }
}