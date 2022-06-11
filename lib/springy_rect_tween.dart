import 'package:flutter/material.dart';

class SpringyRectTween extends RectTween {
  SpringyRectTween({super.begin, super.end});

  final curve = Curves.elasticInOut;

  @override
  Rect? lerp(t) {
    t = curve.transform(t);

    return Rect.lerp(begin, end, t);
  }
}
