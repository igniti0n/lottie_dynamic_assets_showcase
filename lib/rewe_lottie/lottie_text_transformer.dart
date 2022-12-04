import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_example/rewe_lottie/lottie_info.dart';

class LottieTextTransformer {
  final LottieInfo lottieInfo;

  LottieTextTransformer({required this.lottieInfo});

  TextStyle determineLottieTextStyle(LottieFontStyle lottieFont) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  String lottieTextToNumberString(String lottieText) {
    if (lottieText == 'firstTemplate') {
      return 'First number: ${lottieInfo.firstNumber}';
    } else {
      return 'Second number ${lottieInfo.secondNumber}';
    }
  }
}
