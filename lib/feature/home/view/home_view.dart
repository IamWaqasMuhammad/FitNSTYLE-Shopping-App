import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_icons_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/feature/home/controller/home_controller.dart';

import '../../../core/common_widgets/custom_popup_menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person,color: AppColors.surface,),
                  ),
                  Obx(
                    () => Container(
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(AppSizes.radiusLG)
                      ),
                      child: Center(
                        child: CustomPopupMenu(
                          label: controller.selectedCategory.value,
                          items: controller.categoryList,
                          selectedItem: controller.selectedCategory.value,
                          onSelected: controller.changeCategory,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    onTap: () {},
                    icon: Image.asset(
                      AppIconsAssets.shoppingBagIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                    height: 50.h,
                    width: 50.w,
                    borderRadius: AppSizes.radiusCircular,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
