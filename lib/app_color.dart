import 'package:flutter/material.dart';
import 'package:fudiko/util.dart';

extension AppColor on Color {
  static const backgroundLight = Color(0xffFFFFFF);
  static const backgroundDark = Color(0xff000000);

  static const dividerLight = Color(0xff000000);
  static const dividerDark = Color(0xffFFFFFF);

  static const textPrimaryLight = Color(0xff000000);
  static const textPrimaryDark = Color(0xffFFFFFF);

  static const _textSecondaryLight = Color(0xffAAAAAA);
  static const _textSecondaryDark = Color(0xff888888);

  static Color textPrimary(BuildContext context) {
    return isLightMode(context)
        ? AppColor.textPrimaryLight
        : AppColor.textPrimaryDark;
  }

  static Color textSecondary(BuildContext context) {
    return isLightMode(context)
        ? AppColor._textSecondaryLight
        : AppColor._textSecondaryDark;
  }
}
