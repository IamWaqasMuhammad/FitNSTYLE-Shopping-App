import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_image_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.md,
                vertical: 8.h,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomButton(
                  onTap: () {
                    Get.offNamed(AppRoutes.dashboard);
                  },
                  height: 40.w,
                  width: 40.w,
                  icon: Icon(CupertinoIcons.back),
                  backgroundColor: AppColors.lightGrey,
                  isSecondary: true,
                  borderRadius: AppSizes.radiusCircular,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.md,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImageAssets.shoppingBagImg,
                        height: 150.h,
                        width: 150.w,
                        fit: BoxFit.contain,
                      ),
                      16.height,
                      Text(
                        'Your cart is Empty!',
                        style: AppTextStyles.semiBoldLarge,
                        textAlign: TextAlign.center,
                      ),
                      30.height,
                      CustomButton(
                        onTap: () {
                          Get.toNamed(AppRoutes.category);
                        },
                        text: 'Explore Categories',
                        width: 180.w,
                        borderRadius: AppSizes.radiusXXL,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}