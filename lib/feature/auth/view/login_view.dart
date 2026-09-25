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
import 'package:shopping_app/feature/auth/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.xl,
            horizontal: AppSizes.xl,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  controller: controller.emailController,
                  hintText: 'waqasdev@gmail.com',
                  prefixIcon: Icons.person_outline,
                  keyboardType: TextInputType.emailAddress,
                ),
                20.height,

                Text('Password', style: AppTextStyles.medium),
                5.height,
                Obx(
                  () => CustomTextField(
                    controller: controller.passwordController,
                    hintText: '*************',
                    isObscure: controller.isPasswordHidden.value,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () => controller.togglePasswordVisibility(),
                    ),
                  ),
                ),
                5.height,

                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    text: 'Forgot Password?',
                    width: 170.w,
                    height: 40.h,
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primary,
                    isSecondary: true,
                    onTap: () => controller.showForgetBottomSheet(),
                  ),
                ),

                40.height,
                Obx(
                  () => CustomButton(
                    text: 'Login',
                    isLoading: controller.isLoggingIn.value,
                    onTap: () => controller
                        .loginUser(),
                  ),
                ),
                10.height,

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      2.width,
                      GestureDetector(
                        onTap: controller.gotoRegisterScreen,
                        child: Text(
                          "Register",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                40.height,
                CustomButton(
                  onTap: () => controller.continueWithGoogle(),
                  image: Image.asset(AppIconsAssets.googleIcon, height: 24.h),
                  text: 'Continue with Google',
                  backgroundColor: Colors.transparent,
                  isSecondary: true,
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
