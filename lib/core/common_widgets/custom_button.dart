import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? textColor;

  final Color? borderColor;
  final double borderWidth;

  final double? width;
  final double? height;
  final double? borderRadius;

  final bool isLoading;
  final bool isSecondary;
  final bool isOutlined;

  final Widget? icon;
  final Widget? image;

  const CustomButton({
    super.key,
    required this.onTap,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth = 1.5,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isSecondary = false,
    this.isOutlined = false,
    this.icon,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = height ?? 52.h;
    final double radius = borderRadius ?? 12.r;

    final bool hasText = text != null && text!.isNotEmpty;
    final bool hasIcon = icon != null;
    final bool hasImage = image != null;

    final bool isContentOnly = !hasText;

    final double buttonWidth =
        width ?? (isContentOnly ? buttonHeight : double.infinity);

    // Outlined button ka background transparent hoga
    final Color buttonBackground = isOutlined
        ? Colors.transparent
        : backgroundColor ??
        (isSecondary
            ? Colors.transparent
            : AppColors.primary);

    final Color buttonText = textColor ??
        (isOutlined || isSecondary
            ? AppColors.primary
            : AppColors.white);

    final Color buttonBorder =
        borderColor ?? AppColors.primary;

    final Color splashColor = isOutlined || isSecondary
        ? AppColors.primary.withValues(alpha: 0.12)
        : AppColors.white.withValues(alpha: 0.20);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: buttonBackground,
          borderRadius: BorderRadius.circular(radius),

          // Sirf isOutlined true hone par border
          border: isOutlined
              ? Border.all(
            color: buttonBorder,
            width: borderWidth,
          )
              : null,

          boxShadow: (!isSecondary &&
              !isOutlined &&
              buttonBackground != Colors.transparent)
              ? [
            BoxShadow(
              color: buttonBackground.withValues(
                alpha: 0.15,
              ),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: InkWell(
          onTap: isLoading ? null : onTap,
          splashColor: splashColor,
          highlightColor: splashColor.withValues(alpha: 0.5),
          splashFactory: InkRipple.splashFactory,
          child: Center(
            child: isLoading
                ? SizedBox(
              width: 24.w,
              height: 24.w,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor:
                AlwaysStoppedAnimation<Color>(
                  buttonText,
                ),
              ),
            )
                : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hasText ? 16.w : 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasImage) ...[
                    image!,
                    if (hasText) SizedBox(width: 8.w),
                  ],

                  if (hasIcon && !hasImage) ...[
                    icon!,
                    if (hasText) SizedBox(width: 8.w),
                  ],

                  if (hasText)
                    Text(
                      text!,
                      style: AppTextStyles.button.copyWith(
                        color: buttonText,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}