import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_example/rewe_lottie/lottie_info.dart';

class LottieImageTransformer {
  static const firstNumberId = 'image_1';
  static const secondNumberId = 'image_0';
  static const numbersImageBasePath = 'assets/lotties/images/';
  final LottieInfo lottieInfo;

  LottieImageTransformer({required this.lottieInfo});

  ImageProvider<Object>? lottieImageAssetToPlayerImage(LottieImageAsset asset) {
    if (asset.id == firstNumberId) {
      return AssetImage(
        '$numbersImageBasePath${lottieInfo.firstNumber}.png',
      );
    } else {
      return AssetImage(
        '$numbersImageBasePath${lottieInfo.secondNumber}.png',
      );
    }
  }
}
