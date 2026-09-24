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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    2.width,
                    CustomButton(
                      height: 28.h,
                      width: 73.w,
                      isSecondary: true,
                      onTap: ()=> controller.gotoLoginScreen(),
                      text: 'Login',
                      textColor: AppColors.primary,
                      backgroundColor: AppColors.surface,
                    ),
                  ],
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
                isOutlined: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
