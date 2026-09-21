import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_sizes.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Geist';

  // =========================================================
  // DISPLAY
  // =========================================================
  static TextStyle get displayLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontDisplayLarge.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get displayMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontDisplayMedium.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // =========================================================
  // HEADINGS
  // =========================================================
  static TextStyle get headingLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontHeadingLarge.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get headingMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontHeadingMedium.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get headingSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontHeadingSmall.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // =========================================================
  // BODY
  // =========================================================
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyLarge.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyMedium.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodySmall.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // =========================================================
  // MEDIUM UTILITY STYLES
  // =========================================================
  static TextStyle get mediumLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyLarge.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle get medium => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyMedium.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle get mediumSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodySmall.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // =========================================================
  // SEMI BOLD UTILITY STYLES
  // =========================================================
  static TextStyle get semiBoldLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontHeadingSmall.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get semiBold => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyLarge.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get semiBoldSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyMedium.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // =========================================================
  // BOLD UTILITY STYLES
  // =========================================================
  static TextStyle get boldLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontHeadingMedium.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get bold => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyLarge.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get boldSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyMedium.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // =========================================================
  // INTERFACE SPECIFIC
  // =========================================================
  static TextStyle get button => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontButton.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle get productName => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyMedium.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle get productPrice => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyLarge.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get oldPrice => TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.0.sp, // Individual specific raw number tokenized inline
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle get labelLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodyMedium.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontBodySmall.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontLabelSmall.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle get caption => TextStyle(
    fontFamily: fontFamily,
    fontSize: AppSizes.fontCaption.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
