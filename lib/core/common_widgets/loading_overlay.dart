import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import '../../../core/constants/app_colors.dart'; // Apne custom path ke mutabiq adjust karein

class LoadingOverlay extends StatelessWidget {
  final String? loadingMessage;
  const LoadingOverlay({super.key,this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.5), // Semi-transparent dim background
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              strokeWidth: 2.w,
            ),
            15.height,
            Text(
              loadingMessage??'Loading ...',
              style: AppTextStyles.headingSmall.copyWith(
                color: AppColors.white
              )
            ),
          ],
        ),
      ),
    );
  }
}
