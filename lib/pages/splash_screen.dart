import 'dart:async';
import 'dart:math';

import 'package:droidknights/const/route.dart';
import 'package:droidknights/util/animation.dart';
import 'package:flutter/material.dart';

const NUMBER_OF_STARS = 30;

class SplashScreen extends StatefulWidget {

  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  List<Animation<double>> _animations;
  AnimationController _controller;
  List<Map<String, num>> _topAndLefts;

  initState() {
    try {
      super.initState();

      Random random = new Random();
      _topAndLefts = new List<int>.generate(NUMBER_OF_STARS, (int i) => i)
          .map((int i) => random.nextInt(500))
          .map((int left) => left.toDouble())
          .map((double left) => [left, random.nextInt(1000)])
          .map((size) => {'left': size[0], 'top': size[1] / 3.5})
          .toList();

      _initAnimation();

      Timer(Duration(milliseconds: 2500), () async {
        Navigator.pushReplacementNamed(context, Routes.HOME);
      });
    } catch (e) {
      print(e.toString());
      Navigator.pushReplacementNamed(context, Routes.HOME);
    }
  }

  dispose() {
    _disposeAnimation();
    super.dispose();
  }

  void _initAnimation() {
    _controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);

    _animations = [
      makeTweenAnimation(controller: _controller, begin: 0.2, end: 0.6),
      makeTweenAnimation(controller: _controller, begin: 0.5, end: 1),
    ];

    _controller.forward();
  }

  void _disposeAnimation() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) =>
            Scaffold(
                backgroundColor: new Color(0xff143F5F),
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        new Color(0xff000000),
                        new Color(0xff143F5F),
                        new Color(0xff143F5F),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildStar(),
                      _buildLogo(),
                      _buildGraphic(),
                    ],
                  ),
                )
            ),
      );

  Widget _buildStar() =>
      Opacity(
        opacity: calculateAnimationValue(_animations[1], 0, 0.5),
        child: Container(
        height: 200,
        child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(child: Container(width: MediaQuery.of(context).size.width, height: 200)),
            ]..addAll(_buildStars()),
          ),
        ),
      );

  List<Widget> _buildStars() =>
      _topAndLefts.map((topAndLeft) =>
          Positioned(
            top: calculateAnimationValue(_animations[1], topAndLeft['top'] - 20, topAndLeft['top']),
            left: topAndLeft['left'],
            child: Image.asset(
              'assets/images/dk19_appicon_star.png',
              width: 6,
              height: 6,
            ),
          ))
          .toList();

  Widget _buildLogo() =>
      Opacity(
        child: Center(
          child: Image.asset(
            'assets/images/dk19_appicon_transparent.png',
            width: 96,
            height: 96,
          ),
        ),
        opacity: calculateAnimationValue(_animations[0], 0, 1),
      );

  Widget _buildGraphic() =>
      Opacity(
        opacity: 0.0,
        child: Center(
          child: Image.asset(
            'assets/images/dk_main_graphic.png',
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
}
