import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_example/rewe_lottie/lottie_info.dart';

class LottieTextTransformer {
  static const numbers = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  static const templateTitle = 'Tor';
  final LottieInfo lottieInfo;

  LottieTextTransformer({required this.lottieInfo});

  TextStyle determineLottieTextStyle(LottieFontStyle lottieFont) {
    final isBold = lottieFont.style == 'Bold';

    return TextStyle(
      fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
    );
  }

  String lottieTextToPlayerString(String lottieText) {
    return 'Number ${lottieInfo.number}';
  }
}
