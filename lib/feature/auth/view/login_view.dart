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

import '../../../core/common_widgets/forget_password_bottom_sheet.dart';
import '../../../core/utils/routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: 'Forgot Password?',
                  width: 170.w,
                  height: 40.h,
                  backgroundColor: Colors.transparent,
                  textColor: AppColors.primary,
                  isSecondary: false, // Prevents default secondary rectangular border lines from showing up
                  onTap: () => openForgotPasswordSheet(), // Triggers Get.bottomSheet execution process loop
                ),
              ),

              40.height,
              CustomButton(text: 'login', onTap: () {}),
              10.height,
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Register",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(AppRoutes.register),
                      ),
                    ],
                  ),
                ),
              ),


              40.height,
              CustomButton(
                onTap: () {},
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
