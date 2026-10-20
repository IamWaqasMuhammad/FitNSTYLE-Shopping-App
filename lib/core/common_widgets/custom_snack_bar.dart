import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';

enum CustomSnackBarType { success, error, info }

class CustomSnackBar extends StatelessWidget {
  final String title;
  final String message;
  final CustomSnackBarType type;
  final String? actionLabel;
  final VoidCallback? onAction;

  const CustomSnackBar({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.actionLabel,
    this.onAction,
  });

  static void showSuccess({
    required String title,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    _show(
      title: title,
      message: message,
      type: CustomSnackBarType.success,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static void showError({required String title, required String message}) {
    _show(title: title, message: message, type: CustomSnackBarType.error);
  }

  static void showInfo({required String title, required String message}) {
    _show(title: title, message: message, type: CustomSnackBarType.info);
  }

  static void _show({
    required String title,
    required String message,
    required CustomSnackBarType type,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    // CHANGED: Cart actions share one styled, optionally actionable snackbar.
    Get.showSnackbar(
      GetSnackBar(
        messageText: CustomSnackBar(
          title: title,
          message: message,
          type: type,
          actionLabel: actionLabel,
          onAction: onAction,
        ),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.all(12.r),
        boxShadows: const [],
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (type) {
      CustomSnackBarType.success => (
        Icons.check_circle_outline,
        AppColors.success,
      ),
      CustomSnackBarType.error => (Icons.error_outline, AppColors.error),
      CustomSnackBarType.info => (Icons.info_outline, AppColors.info),
    };

    return Material(
      color: AppColors.textPrimary,
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22.r),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.semiBoldSmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              SizedBox(width: 8.w),
              TextButton(
                onPressed: () {
                  Get.closeCurrentSnackbar();
                  onAction?.call();
                },
                child: Text(
                  actionLabel!,
                  style: AppTextStyles.semiBoldSmall.copyWith(
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
