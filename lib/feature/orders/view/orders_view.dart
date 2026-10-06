import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
      child: Column(
        children: [
          Center(child: Text('Orders', style: AppTextStyles.semiBoldLarge)),
          20.height,

          Obx(
            () => CustomChipsTabBar<String>(
              items: controller.tabs,
              selectedItem: controller.selectedStatusTab.value,
              labelBuilder: (String routePath) =>
                  controller.getTabLabel(routePath),
              onTabSelected: (String value) =>
                  controller.selectedStatusTab.value = value,
            ),
          ),
          SizedBox(height: 15.h),

          // 2. Active View Container matching Controller Logic
          Expanded(child: Obx(() => controller.activeOrderView)),
        ],
      ),
    );
  }
}
