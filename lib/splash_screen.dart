import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Navigator.pop(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFF112030),
          child: Center(
            child: new Stack(children: <Widget>[
              new Image.asset(
                'assets/images/dk_main_graphic.png',
                fit: BoxFit.fitWidth,
              ),
              new Image.asset(
                'assets/images/dk_title.png',
                fit: BoxFit.fitWidth,
              ),
            ]),
          )),
    );
  }
}
