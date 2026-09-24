import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class CustomBottomSheet {
  CustomBottomSheet._();

  static void show({
    required Widget child,
    double? maxHeight,
    double borderRadius = 24,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
  }) {
    Get.bottomSheet(
      GestureDetector(
        onTap: () => FocusScope.of(Get.context!).unfocus(),
        child: Container(
          width: double.infinity,
          constraints: maxHeight != null
              ? BoxConstraints(
            maxHeight: maxHeight.h,
          )
              : null,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius.r),
              topRight: Radius.circular(borderRadius.r),
            ),
          ),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      barrierColor: AppColors.overlay,
    );
  }
}