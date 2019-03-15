import 'package:flutter/widgets.dart';

Animation<double> makeTweenAnimation({
  @required Animation controller,
  @required double begin,
  @required double end,
  Curve curve = Curves.ease,
}) =>
    Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(begin, end, curve: curve),
      ),
    );

double calculateAnimationValue(Animation<double> animation, double begin, double end) =>
    (begin * (1 - animation.value)) + (end * animation.value);

double calculateTweenValue(double value, double begin, double end) =>
    (begin * (1 - value)) + (end * value);
