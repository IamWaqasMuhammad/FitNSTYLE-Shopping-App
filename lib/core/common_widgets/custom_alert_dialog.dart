
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final bool isDestructive;
  final VoidCallback onConfirm;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.isDestructive = false,
  });

  // CHANGED: Reusable dialog display method.
  static Future<void> show({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool isDestructive = false,
  }) async {
    await Get.dialog<void>(
      CustomAlertDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
        cancelText: cancelText,
        isDestructive: isDestructive,
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color actionColor =
    isDestructive ? AppColors.error : AppColors.primary;

    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CHANGED: Dialog icon.
            Container(
              height: 52.h,
              width: 52.w,
              decoration: BoxDecoration(
                color: actionColor.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDestructive
                    ? Icons.warning_amber_rounded
                    : Icons.help_outline_rounded,
                color: actionColor,
                size: 27.sp,
              ),
            ),

            SizedBox(height: 16.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBoldLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textLight,
              ),
            ),

            SizedBox(height: 24.h),

            // CHANGED: Confirmation actions.
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44.h,
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        side: BorderSide(
                          color: AppColors.textLight.withValues(
                            alpha: 0.3,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSizes.radiusMD,
                          ),
                        ),
                      ),
                      child: Text(
                        cancelText,
                        style: AppTextStyles.semiBoldSmall,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: SizedBox(
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        onConfirm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: actionColor,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSizes.radiusMD,
                          ),
                        ),
                      ),
                      child: Text(
                        confirmText,
                        style: AppTextStyles.semiBoldSmall.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
