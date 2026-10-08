import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

class CustomListTile extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final bool isLoading;
  final Widget? leadingImage;
  final Widget? leadingIcon;
  final Widget? trailingImage;
  final Widget? trailingIcon;
  final String text;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    this.height,
    this.width = double.infinity,
    this.backgroundColor,
    this.isLoading = false,
    this.leadingImage,
    this.leadingIcon,
    this.trailingImage,
    this.trailingIcon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 24.w,
        height: 24.w,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColors.primary,
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        AppSizes.radiusMD,
      ),

      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            AppSizes.radiusMD,
          ),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ?leadingImage,
            ?leadingIcon,
            20.width,
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailingImage != null ||
                trailingIcon != null)
              12.width,
            ?trailingImage,
            ?trailingIcon,
          ],
        ),
      ),
    );
  }
}