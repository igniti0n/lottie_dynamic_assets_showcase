import 'package:flutter/material.dart';

class OpacityScaledAnimation extends StatelessWidget {
  static const double maxValue = 1;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final bool shouldScale;
  final bool shouldFade;
  const OpacityScaledAnimation({
    required this.child,
    this.curve = Curves.easeInOutCubic,
    this.duration = const Duration(milliseconds: 600),
    this.shouldFade = true,
    this.shouldScale = true,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: maxValue),
      curve: curve,
      duration: duration,
      builder: (context, value, animationChild) => Opacity(
        opacity: shouldFade ? value : maxValue,
        child: Transform.scale(
          scale: shouldScale ? value : maxValue,
          child: animationChild,
        ),
      ),
      child: child,
    );
  }
}
