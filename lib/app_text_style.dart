import 'package:flutter/material.dart';
import 'package:fudiko/app_color.dart';
import 'package:fudiko/gen/fonts.gen.dart';

extension AppThemeData on ThemeData {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColor.backgroundLight,
      dividerColor: AppColor.dividerLight,
      iconTheme:
          ThemeData.light().iconTheme.copyWith(color: AppColor.iconLight),
      textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: AppTextStyle._bodySmallBase
                .copyWith(color: AppColor.textPrimaryLight),
            bodyMedium: AppTextStyle._bodyMediumBase
                .copyWith(color: AppColor.textPrimaryLight),
            titleMedium: AppTextStyle._titleMediumBase
                .copyWith(color: AppColor.textPrimaryLight),
          ),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColor.backgroundDark,
      dividerColor: AppColor.dividerDark,
      iconTheme: ThemeData.dark().iconTheme.copyWith(color: AppColor.iconDark),
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodySmall: AppTextStyle._bodySmallBase
                .copyWith(color: AppColor.textPrimaryDark),
            bodyMedium: AppTextStyle._bodyMediumBase
                .copyWith(color: AppColor.textPrimaryDark),
            titleMedium: AppTextStyle._titleMediumBase
                .copyWith(color: AppColor.textPrimaryDark),
          ),
    );
  }
}

extension AppTextStyle on TextStyle {
  static const base = TextStyle(
    fontFamily: FontFamily.lINESeed,
    height: 1,
  );

  static final TextStyle _bodySmallBase =
      AppTextStyle.base.copyWith(fontSize: 14);

  static final TextStyle _bodyMediumBase =
      AppTextStyle.base.copyWith(fontSize: 16);

  static final TextStyle _titleMediumBase =
      AppTextStyle.base.copyWith(fontSize: 20);

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  static TextStyle body(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!;
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get extraBold {
    return copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle secondary(BuildContext context) {
    return copyWith(color: AppColor.textSecondary(context));
  }
}
