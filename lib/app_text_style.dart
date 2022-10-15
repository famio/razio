import 'package:flutter/material.dart';
import 'package:fudiko/app_color.dart';

extension AppThemeData on ThemeData {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColor.backgroundLight,
      dividerColor: AppColor.dividerLight,
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
  static const base = TextStyle(height: 1);

  static final TextStyle _bodySmallBase =
      AppTextStyle.base.copyWith(fontSize: 15);
  static final TextStyle _bodyMediumBase =
      AppTextStyle.base.copyWith(fontSize: 17);
  static final TextStyle _titleMediumBase =
      AppTextStyle.base.copyWith(fontSize: 20);

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!;
  }
}
