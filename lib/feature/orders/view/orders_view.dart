
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/feature/orders/controller/order_controller.dart';

import '../../../core/common_widgets/custom_chips_tab_bar.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderController>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.height,

            // CHANGED: Improved Orders header.
            Row(
              children: [
                Expanded(
                  child: Text(
                    'My Orders',
                    style: AppTextStyles.headingLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Container(
                  height: 42.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(
                      AppSizes.radiusCircular,
                    ),
                  ),
                  child: Icon(
                    Icons.receipt_long_rounded,
                    color: AppColors.primary,
                    size: 21.sp,
                  ),
                ),
              ],
            ),

            6.height,

            Text(
              'Track and manage your orders',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textLight,
              ),
            ),

            22.height,

            // CHANGED: Only three order status tabs.
            Obx(
                  () => CustomChipsTabBar<String>(
                items: controller.tabs,
                selectedItem: controller.selectedStatusTab.value,
                labelBuilder: (String status) {
                  return controller.getTabLabel(status);
                },
                onTabSelected: (String value) {
                  controller.selectedStatusTab.value = value;
                },
              ),
            ),

            18.height,

            // CHANGED: Order content fills remaining screen.
            Expanded(
              child: Obx(
                    () => controller.activeOrderView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
