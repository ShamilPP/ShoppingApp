import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

abstract class AppTextStyle {
  static const headingPrimary = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorPrimary,
  );

  static const headingSecondary = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textColorPrimary,
  );

  static const titleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textColorPrimary,
  );

  static const subTitleText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorPrimary,
  );

  static const subTitleBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textColorPrimary,
  );

  static const paragraphText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorPrimary,
  );

  static const paragraphBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textColorSecondary,
  );

  static const paragraphBlackBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textColorPrimary,
  );

  static const subParagraphText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textColorSecondary,
  );

  static const subParagraphTextBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorPrimary,
  );

  static const subParagraphExtraBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textColorPrimary,
  );
}
