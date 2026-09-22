import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text; // Optional kiya takay icon-only/image-only chal sakay
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isLoading;

  // Naye flex capabilities 👇
  final Widget? icon;         // Kisi bhi Flutter Icon widget k liye (e.g., Icon(Icons.add))
  final Widget? image;        // Local/Network images ya SVG vectors k liye (e.g., Image.asset('path'))
  final bool isSecondary;     // Quick toggle for borders/transparent look

  const CustomButton({
    super.key,
    required this.onTap,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.icon,
    this.image,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    // Styling configurations based on primary/secondary properties
    final double defaultHeight = height ?? 52.h;
    final double defaultRadius = borderRadius ?? 12.r;

    Color buttonBgColor = backgroundColor ?? (isSecondary ? Colors.transparent : AppColors.primary);
    Color buttonTextColor = textColor ?? (isSecondary ? AppColors.textPrimary : AppColors.white);
    Color rippleColor = isSecondary ? AppColors.textSecondary.withOpacity(0.1) : AppColors.white.withOpacity(0.2);

    // If it's icon/image only (No text provided), make it square by default if width isn't explicitly set
    final bool isContentOnly = text == null;
    final double? calculatedWidth = width ?? (isContentOnly ? defaultHeight : double.infinity);

    return Container(
      width: calculatedWidth,
      height: defaultHeight,
      decoration: BoxDecoration(
        color: buttonBgColor,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: isSecondary ? Border.all(color: AppColors.primary, width: 2) : null,
        boxShadow: (!isSecondary && buttonBgColor != Colors.transparent)
            ? [
          BoxShadow(
            color: buttonBgColor.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultRadius),
        child: InkWell(
          onTap: isLoading ? null : onTap,
          splashColor: rippleColor,
          highlightColor: rippleColor.withOpacity(0.5),
          child: Center(
            child: isLoading
                ? SizedBox(
              width: 24.w,
              height: 24.w,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(buttonTextColor),
              ),
            )
                : Padding(
              padding: EdgeInsets.symmetric(horizontal: isContentOnly ? 0 : 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Check for Image asset/network/svg vector
                  if (image != null) ...[
                    image!,
                    if (text != null) SizedBox(width: 8.w),
                  ],

                  // 2. Check for Standard Icon
                  if (icon != null && image == null) ...[
                    icon!,
                    if (text != null) SizedBox(width: 8.w),
                  ],

                  // 3. Render Text if available
                  if (text != null)
                    Text(
                      text!,
                      style: AppTextStyles.button.copyWith(
                        color: buttonTextColor,
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
