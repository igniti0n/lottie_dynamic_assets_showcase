import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_example/rewe_lottie/lottie_info.dart';

class LottieImageTransformer {
  static const playerImageId = 'image_1.png';
  static const playerSignatureImageId = 'image_0.png';
  static const playerImageBasePath = 'assets/lotties/players/images/';
  final LottieInfo lottieInfo;

  LottieImageTransformer({required this.lottieInfo});

  ImageProvider<Object>? lottieImageAssetToPlayerImage(LottieImageAsset asset) {
    final playerNumber = lottieInfo.number;
    if (asset.id == playerImageId) {
      return AssetImage(
        '$playerImageBasePath$playerNumber.png',
      );
    }
    if (asset.id == playerSignatureImageId) {
      return AssetImage(
        '$playerImageBasePath${playerNumber}_sign.png',
      );
    }
    return null;
  }
}
