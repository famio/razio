import 'package:flutter/material.dart';
import 'package:fudiko/util.dart';

extension AppColor on Color {
  static const accent = Color(0xffFF6D25);

  static const _borderLight = Color(0xffBEBEBE);
  static const _borderDark = Color(0xff606060);
  static Color border(BuildContext context) {
    return isLightMode(context) ? AppColor._borderLight : AppColor._borderDark;
  }

  static const backgroundLight = Color(0xffFFFFFF);
  static const backgroundDark = Color(0xff141419);
  static Color background(BuildContext context) {
    return isLightMode(context)
        ? AppColor.backgroundLight
        : AppColor.backgroundDark;
  }

  static const dividerLight = Color(0xff000000);
  static const dividerDark = Color(0xffFFFFFF);

  static const textPrimaryLight = Color(0xff4E4E4E);
  static const textPrimaryDark = Color(0xffDCDCDC);
  static Color textPrimary(BuildContext context) {
    return isLightMode(context)
        ? AppColor.textPrimaryLight
        : AppColor.textPrimaryDark;
  }

  static const _textSecondaryLight = Color(0xff515151);
  static const _textSecondaryDark = Color(0xffA0A0A0);
  static Color textSecondary(BuildContext context) {
    return isLightMode(context)
        ? AppColor._textSecondaryLight
        : AppColor._textSecondaryDark;
  }

  static const _highlightGradientLight = <Color>[
    Color(0xffF6F6F6),
    Color(0xffEBEBEB),
  ];

  static const _highlightGradientDark = <Color>[
    Color(0xff282828),
    Color(0xff232323),
  ];

  static List<Color> highlightGradient(BuildContext context) {
    return isLightMode(context)
        ? _highlightGradientLight
        : _highlightGradientDark;
  }
}
