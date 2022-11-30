import 'package:flutter/material.dart';

class OpacityTransitionControlableAnimation extends StatelessWidget {
  static const double maxValue = 1;
  static const double defaultTranslation = 40;
  final Widget child;
  final Curve curve;
  late final Animation<double> listenable;
  final bool shouldFade;
  final double xOffset;
  final double yOffset;
  OpacityTransitionControlableAnimation({
    required this.child,
    required AnimationController controller,
    this.xOffset = 0,
    this.yOffset = defaultTranslation,
    double begin = 0,
    this.shouldFade = true,
    double end = maxValue,
    this.curve = Curves.easeInOutCubic,
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
        child: Transform.translate(
          offset: Offset(
            xOffset - (xOffset * listenable.value),
            yOffset - (yOffset * listenable.value),
          ),
          child: animationChild,
        ),
      ),
      child: child,
    );
  }
}
