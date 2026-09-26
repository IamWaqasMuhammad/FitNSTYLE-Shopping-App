import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/home/controller/home_controller.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomPopupMenu extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String> onSelected;

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? elevation;

  const CustomPopupMenu({
    super.key,
    required this.label,
    required this.items,
    required this.onSelected,
    this.selectedItem,
    this.width,
    this.height,
    this.backgroundColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return PopupMenuButton<String>(
      onOpened: controller.onMenuOpened,
      onCanceled: controller.onMenuClosed,
      onSelected: (value) {
        controller.onMenuClosed();
        onSelected(value);
      },

      color: backgroundColor ?? AppColors.surface,
      elevation: elevation ?? 6,
      offset: Offset(0, 40.h),
      borderRadius: BorderRadius.circular(14.r),

      constraints: BoxConstraints(
        minWidth: width ?? 150.w,
        maxWidth: width ?? 200.w,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),

      itemBuilder: (context) {
        return items.map((item) {
          final isSelected = item == selectedItem;

          return PopupMenuItem<String>(
            value: item,
            height: height ?? 45.h,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                    ),
                  ),
                ),

                if (isSelected)
                  Icon(
                    Icons.check_rounded,
                    size: 18.sp,
                    color: AppColors.primary,
                  ),
              ],
            ),
          );
        }).toList();
      },

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedItem ?? label,
              style: AppTextStyles.semiBold,
            ),
          ),

          SizedBox(width: 4.w),

          // CHANGED: Obx arrow ko GetX state ke according rebuild karega
          Obx(
                () => AnimatedRotation(
              turns: controller.isMenuOpen.value ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}