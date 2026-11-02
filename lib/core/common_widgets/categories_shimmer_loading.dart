import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/core/constants/app_colors.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightGrey,
      highlightColor: AppColors.surfaceSecondary,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // Match the max preview size constraint
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Column(
              children: [
                // CIRCULAR IMAGE PLACEHOLDER
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                8.verticalSpace,
                // TEXT STRIP PLACEHOLDER
                Container(
                  width: 50.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
