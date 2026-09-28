import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: 75.w,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 58.h,
              width: 58.w,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(16.r),
              ),

              // CHANGED: Image ko poore container mein fill karwaya.
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  image,

                  // CHANGED: Image ab poora container fill karegi.
                  fit: BoxFit.cover,

                  // CHANGED: Image load na ho to fallback icon.
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.textLight,
                      size: 24.sp,
                    );
                  },

                  // CHANGED: Image load hone tak loader.
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Center(
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}