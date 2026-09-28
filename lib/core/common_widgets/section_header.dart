import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'custom_button.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String buttonText;
  final double? titleFontSize;
  final Color? titleColor;
  final VoidCallback onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.buttonText = 'See All',
    required this.onSeeAllTap,
    this.titleFontSize,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.headingLarge.copyWith(
            color: titleColor ?? AppColors.black,
            fontSize: titleFontSize,
          ),
        ),
        CustomButton(
          onTap: () {},
          text: buttonText,
          height: 30.h,
          width: 85.w,
          textColor:  AppColors.black,
          backgroundColor: Colors.transparent,
          isSecondary: true,
        ),
      ],
    );
  }
}
