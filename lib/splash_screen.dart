import 'package:flutter/material.dart';
import 'dart:async';
import 'package:droidknights/res/strings.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF112030),
        child: Center(
            child: new Stack(children: <Widget>[
          new Image.asset(
            Strings.INFO_TAB_IMAGES_PATH_DK_MAIN_GRAPHIC,
            fit: BoxFit.fitWidth,
          ),
          new Image.asset(
            Strings.INFO_TAB_IMAGES_PATH_DK_TITLE,
            fit: BoxFit.fitWidth,
          ),
        ])),
      ),
    );
  }
}
