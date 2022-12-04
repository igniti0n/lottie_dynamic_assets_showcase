import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_example/rewe_lottie/lottie_image_transformer.dart';
import 'package:lottie_example/rewe_lottie/lottie_info.dart';
import 'package:lottie_example/rewe_lottie/lottie_text_transformer.dart';

class NumbersLottie extends StatelessWidget {
  late final LottieImageTransformer _lottieImageTransformer;
  late final LottieTextTransformer _lottieTextTransformer;

  NumbersLottie({
    super.key,
    required LottieInfo lottieInfo,
  }) {
    _lottieImageTransformer = LottieImageTransformer(lottieInfo: lottieInfo);
    _lottieTextTransformer = LottieTextTransformer(lottieInfo: lottieInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/numbers.json',
      repeat: true,
      imageProviderFactory:
          _lottieImageTransformer.lottieImageAssetToPlayerImage,
      delegates: LottieDelegates(
        text: _lottieTextTransformer.lottieTextToNumberString,
        textStyle: _lottieTextTransformer.determineLottieTextStyle,
      ),
    );
  }
}
