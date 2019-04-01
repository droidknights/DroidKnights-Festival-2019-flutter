import 'dart:math';

import 'package:droidknights/const/route.dart';
import 'package:droidknights/util/animation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

const NUMBER_OF_STARS = 30;
const ANIMATION_TIME_MILL = 2500;

class SplashScreen extends StatefulWidget {

  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  List<Animation<double>> _animations;
  AnimationController _controller;
  List<Point<double>> _topAndLefts;

  @override
  void initState() {
    super.initState();

    Random random = new Random();
    _topAndLefts = new List<int>.generate(NUMBER_OF_STARS, (int i) => i)
        .map((int i) => Point(random.nextInt(500).toDouble(), random.nextInt(1000) / 3.5))
        .toList();

    _initAnimation();
  }

  void animationListener(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      Navigator.pushReplacementNamed(context, Routes.HOME);
    }
  }

  void _initAnimation() {
    _controller = AnimationController(duration: Duration(milliseconds: ANIMATION_TIME_MILL), vsync: this);

    _controller.addStatusListener(animationListener);

    _animations = [
      makeTweenAnimation(controller: _controller, begin: 0.2, end: 0.6),
      makeTweenAnimation(controller: _controller, begin: 0.5, end: 1),
    ];

    _controller.forward();
  }

  @override
  void dispose() {
    _disposeAnimation();
    super.dispose();
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
                  child: _splashImages(),
                )
            ),
      );

  Widget _splashImages() {
    if(Platform.isAndroid) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildStar(),
          _buildLogo(),
          _buildGraphic(),
        ],
      );
    } else {
      return Container();
    }
  }

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
            top: calculateAnimationValue(_animations[1], topAndLeft.y - 20, topAndLeft.y),
            left: topAndLeft.x,
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
