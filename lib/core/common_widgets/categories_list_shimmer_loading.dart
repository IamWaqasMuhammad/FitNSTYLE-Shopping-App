import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/core/constants/app_colors.dart';

// 🔴 UPPER CASE DETAILED COMMENT:
// THIS EXACT CLASS NAME MUST BE EXPORTED FROM THIS FILE PATH TO BE RECOGNIZED BY THE CATEGORY VIEW
class CategoryListShimmerLoading extends StatelessWidget {
  const CategoryListShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightGrey,
      highlightColor: AppColors.surfaceSecondary,
      period: const Duration(milliseconds: 1500),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6, // RENDER 6 LOADING SHIMMER TILES
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Container(
              height: 75.h, // HEIGHT MATCHES USER CATEGORY LIST ITEM LAYOUTS
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        },
      ),
    );
  }
}
