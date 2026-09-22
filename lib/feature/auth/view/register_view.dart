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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              Text('Create your Account!', style: AppTextStyles.headingLarge),
              20.height,

              // Full Name Field
              Text('Full Name', style: AppTextStyles.medium),
              5.height,
              const CustomTextField(
                hintText: 'Waqas Dev',
                prefixIcon: Icons.person_outline,
              ),
              20.height,

              // Email Field
              Text('Email', style: AppTextStyles.medium),
              5.height,
              const CustomTextField(
                hintText: 'waqasdev@gmail.com',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              20.height,

              // Password Field
              Text('Password', style: AppTextStyles.medium),
              5.height,
              const CustomTextField(
                hintText: '*************',
                suffixIcon: Icon(Icons.visibility_off),
                prefixIcon: Icons.lock_outline,
                isObscure: true,
              ),
              20.height,

              // Confirm Password Field
              Text('Confirm Password', style: AppTextStyles.medium),
              5.height,
              const CustomTextField(
                hintText: '*************',
                suffixIcon: Icon(Icons.visibility_off),
                prefixIcon: Icons.lock_outline,
                isObscure: true,
                textInputAction: TextInputAction.done,
              ),
              40.height,

              // Register Button
              CustomButton(text: 'Register', onTap: () {}),
              10.height,

              // Login Redirect Text
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Login",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                      ),
                    ],
                  ),
                ),
              ),
              40.height,

              // Google Social SignUp
              CustomButton(
                onTap: () {},
                image: Image.asset(AppIconsAssets.googleIcon, height: 28.h),
                text: 'Sign up with Google',
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
