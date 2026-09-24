import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_icons_assets.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/feature/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.find<SplashController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(AppIconsAssets.appIcon),
              height: 200.h,
              width: 200.w,
            ),
          ),
          Text('FitNSTYLE',style: AppTextStyles.headingLarge,),
          5.height,
          Text('Fit your vibe, Style your life',style: AppTextStyles.bodyLarge,),
          30.height,
          CircularProgressIndicator(
            strokeWidth: 3,
            color: AppColors.primary,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          )
        ],
      ),
    );
  }
}
