import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/constants/app_image_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AppImageAssets.bellImg,
            height: 150.h,
            width: 150.w,
          ),
        ),
        10.height,
        Text('No notifications yet!', style: AppTextStyles.semiBoldLarge),
        40.height,
        CustomButton(
          onTap: () {
            Get.toNamed(AppRoutes.category);
          },
          text: 'Explore Categories',
          width: 180.w,
          borderRadius: AppSizes.radiusXXL,
        ),
      ],
    );
  }
}
