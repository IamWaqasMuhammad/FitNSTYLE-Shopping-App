import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_text_field.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_icons_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/feature/auth/controller/auth_controller.dart';

import '../../../core/utils/routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.xl,
          horizontal: AppSizes.xl,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.height,
              Text('Login your Account!', style: AppTextStyles.headingLarge),
              20.height,
              Text('Email', style: AppTextStyles.medium),
              5.height,
              CustomTextField(
                hintText: 'waqasdev@gmail.com',
                prefixIcon: Icons.person,
              ),
              20.height,

              Text('Password', style: AppTextStyles.medium),
              5.height,
              CustomTextField(
                hintText: '*************',
                suffixIcon: Icon(Icons.visibility_off),
                prefixIcon: Icons.lock,
              ),
              5.height,
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: 'Forgot Password?',
                  width: 167.w,
                  height: 40.h,
                  backgroundColor: Colors.transparent,
                  textColor: AppColors.primary,
                  isSecondary: true,
                  onTap: () => controller
                      .showForgetBottomSheet(), // Triggers Get.bottomSheet execution process loop
                ),
              ),

              40.height,
              CustomButton(text: 'login', onTap: () {}),
              10.height,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    2.width,
                    CustomButton(
                      height: 28.h,
                      width: 95.w,
                      isSecondary: true,
                      onTap: controller.gotoRegisterScreen,
                      text: 'Register',
                      textColor: AppColors.primary,
                      backgroundColor: AppColors.surface,
                    ),
                  ],
                ),
              ),

              40.height,
              CustomButton(
                onTap: () {},
                isOutlined: true,
                image: Image.asset(AppIconsAssets.googleIcon, height: 28.h),
                text: 'Continue with Google',
                backgroundColor: Colors.transparent,

                isSecondary: true,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
