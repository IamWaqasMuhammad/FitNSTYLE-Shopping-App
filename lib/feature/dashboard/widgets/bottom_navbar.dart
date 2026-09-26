import 'package:flutter/cupertino.dart';
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
    const items = [
      CupertinoIcons.home,
      CupertinoIcons.bell,
      CupertinoIcons.square_list,
      CupertinoIcons.person,
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
            items.length,
            (index) => NavbarItem(
              icon: items[index],
              isSelected: currentIndex == index,
              onTap: () => onItemTap(index),
            ),
          ),
        ),
      ),
    );
  }
}
