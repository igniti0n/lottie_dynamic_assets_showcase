import 'package:flutter/material.dart';

class OpacityScaledControlableAnimation extends StatelessWidget {
  static const double maxValue = 1;
  final Widget child;
  final Curve curve;
  final bool shouldScale;
  final bool shouldFade;
  late final Animation<double> listenable;
  OpacityScaledControlableAnimation({
    required this.child,
    required AnimationController controller,
    double begin = 0,
    double end = maxValue,
    this.curve = Curves.easeInOutCubic,
    this.shouldFade = true,
    this.shouldScale = true,
  }) {
    listenable = CurvedAnimation(
      parent: controller,
      curve: Interval(
        begin,
        end,
        curve: curve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: listenable,
      builder: (context, animationChild) => Opacity(
        opacity: shouldFade ? listenable.value : maxValue,
        child: Transform.scale(
          scale: shouldScale ? listenable.value : maxValue,
          child: animationChild,
        ),
      ),
      child: child,
    );
  }
}
