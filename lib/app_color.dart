import 'package:flutter/material.dart';
import 'package:fudiko/util.dart';

extension AppColor on Color {
  static const accent = Color(0xffFF6D25);

  static const backgroundLight = Color(0xffFFFFFF);
  static const backgroundDark = Color(0xff000000);
  static Color background(BuildContext context) {
    return isLightMode(context)
        ? AppColor.backgroundLight
        : AppColor.backgroundDark;
  }

  static const dividerLight = Color(0xff000000);
  static const dividerDark = Color(0x66FFFFFF);
  static Color divider(BuildContext context) {
    return isLightMode(context) ? AppColor.dividerLight : AppColor.dividerDark;
  }

  static const textPrimaryLight = Color(0xff4E4E4E);
  static const textPrimaryDark = Color(0xffFFFFFF);
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

  static const _highlightBarLight = Color(0xffDDDDDD);
  static const _highlightBarDark = Color(0xff222222);
  static Color highlightBar(BuildContext context) {
    return isLightMode(context) ? _highlightBarLight : _highlightBarDark;
  }

  static const iconLight = Color(0xff222222);
  static const iconDark = Color(0xffDCDCDC);
  static Color icon(BuildContext context) {
    return isLightMode(context) ? iconLight : iconDark;
  }

  static const _frostLight = Color(0xffEEEEEF);
  static const _frostDark = Color(0xff1C1C1E);
  static Color frost(BuildContext context) {
    return isLightMode(context) ? _frostLight : _frostDark;
  }
}
