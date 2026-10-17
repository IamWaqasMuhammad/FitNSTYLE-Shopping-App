import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import 'navbar_items.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Unselected icons ki list
    const unselectedIcons = [
      Icons.home_outlined,
      Icons.notifications_none_rounded,
      Icons.format_list_bulleted_outlined,
      CupertinoIcons.person,
    ];

    // 2. Selected/Active icons ki list
    const selectedIcons = [
      Icons.home,
      Icons.notifications_rounded,
      CupertinoIcons.square_list,
      Icons.person,
    ];

    return Padding(
      padding: EdgeInsets.all(AppSizes.md),
      child: Container(
        height: AppSizes.bottomNavHeight,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.radiusXXL),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey.withValues(alpha: .8),
              blurRadius: 12,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            unselectedIcons.length, // Total loops size configuration
                (index) {
              // 🟢 CHANGED: Condition apply ki hai jo check karegi active state
              final bool isSelected = currentIndex == index;

              return NavbarItem(
                // Selected hai toh selectedIcons se, warna unselectedIcons se icon milega
                icon: isSelected ? selectedIcons[index] : unselectedIcons[index],
                isSelected: isSelected,
                onTap: () => onItemTap(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
