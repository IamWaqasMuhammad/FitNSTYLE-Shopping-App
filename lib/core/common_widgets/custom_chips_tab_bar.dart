import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class CustomChipsTabBar<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final String Function(T item) labelBuilder;
  final ValueChanged<T> onTabSelected;
  final EdgeInsetsGeometry? padding;

  const CustomChipsTabBar({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.labelBuilder,
    required this.onTabSelected,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h, // Bounded responsive height layout configuration
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final T item = items[index];
          // CHANGED: Checking identity match instead of index limits for universal mapping
          final bool isSelected = item == selectedItem;

          return GestureDetector(
            onTap: () => onTabSelected(item),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200), // Fluid status indicator shift
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
              decoration: BoxDecoration(
                // CHANGED: High contrast color setup matching modern shopping applications core schemes
                color: isSelected ? AppColors.primary : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  labelBuilder(item),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isSelected ? AppColors.surface : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
