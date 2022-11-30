import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_example/rewe_lottie/lottie_image_transformer.dart';
import 'package:lottie_example/rewe_lottie/lottie_info.dart';
import 'package:lottie_example/rewe_lottie/lottie_text_transformer.dart';

class CardScanLottie extends HookWidget {
  final bool isAnimated;
  final void Function()? onAnimationFinished;
  late final LottieTextTransformer _lottieTextTransformer;
  late final LottieImageTransformer _lottieImageTransformer;

  CardScanLottie({
    required LottieInfo lottiePlayerInfo,
    this.isAnimated = true,
    this.onAnimationFinished,
  }) {
    _lottieTextTransformer =
        LottieTextTransformer(lottieInfo: lottiePlayerInfo);
    _lottieImageTransformer =
        LottieImageTransformer(lottieInfo: lottiePlayerInfo);
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      initialValue: isAnimated ? 0 : 1,
    );
    animationController.addStatusListener(_onAnimationStatusChanged);

    return Lottie.asset(
      'assets/lotties/players/player-profile-common.json',
      repeat: false,
      controller: Tween<double>(begin: 0, end: 1).animate(animationController),
      animate: isAnimated,
      onLoaded: (lottieComposition) => animationController.animateTo(1,
          duration: lottieComposition.duration),
      imageProviderFactory: (lottieImageAsset) => _lottieImageTransformer
          .lottieImageAssetToPlayerImage(lottieImageAsset),
      delegates: LottieDelegates(
        textStyle: (lottieFont) =>
            _lottieTextTransformer.determineLottieTextStyle(lottieFont),
        text: (lottieText) =>
            _lottieTextTransformer.lottieTextToPlayerString(lottieText),
      ),
    );
  }

  void _onAnimationStatusChanged(status) {
    if (status == AnimationStatus.completed) {
      onAnimationFinished?.call();
    }
  }
}
