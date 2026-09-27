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
import 'package:shopping_app/feature/auth/controller/register_controller.dart';

class RegisterView extends StatelessWidget {
   RegisterView({super.key});

  final controller = Get.find<RegisterController>();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.xl,
            vertical: AppSizes.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.height,

              // Title
              _buildTitle(),

              24.height,

              // Labels and forms
              _buildRegisterForm(),

              32.height,

              // Register button
              _buildRegisterButton(),

              12.height,

              // Login redirect method
              _buildLoginRedirect(),

              32.height,

              // Register button with google
              _buildGoogleButton(),
            ],
          ),
        ),
      ),
    );
  }













  // **********////////////////////////////////////****************
  // ========== Register Screen private components ================
  //***********////////////////////////////////////****************

  /// Title text Method (Create your account!)
  Widget _buildTitle() {
    return Text(
      'Create your Account!',
      style: AppTextStyles.headingLarge,
    );
  }

  /// Register your account form method (Labels + Forms)
  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField(
          label: 'Full Name',
          child: const CustomTextField(
            hintText: 'Waqas Dev',
            prefixIcon: Icon(Icons.person_outline),
            textInputAction: TextInputAction.next,
          ),
        ),

        20.height,

        _buildField(
          label: 'Email',
          child: const CustomTextField(
            hintText: 'waqasdev@gmail.com',
            prefixIcon: Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
        ),

        20.height,

        _buildField(
          label: 'Password',

          // CHANGED: Obx added so password field rebuilds
          child: Obx(
                () => CustomTextField(
              hintText: '*************',
              prefixIcon: const Icon(Icons.lock_outline),

              // CHANGED: Icon now changes according to password visibility
              suffixIcon: IconButton(
                onPressed: controller.togglePasswordVisibility,
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),

              // CHANGED: Obscure value is now controlled by GetX
              isObscure: controller.isPasswordHidden.value,

              textInputAction: TextInputAction.next,
            ),
          ),
        ),

        20.height,

        _buildField(
          label: 'Confirm Password',

          // CHANGED: Obx added for confirm-password visibility
          child: Obx(
                () => CustomTextField(
              hintText: '*************',
              prefixIcon: const Icon(Icons.lock_outline),

              // CHANGED: Separate toggle for confirm password
              suffixIcon: IconButton(
                onPressed: controller.toggleConfirmPasswordVisibility,
                icon: Icon(
                  controller.isConfirmPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),

              // CHANGED: Uses separate GetX state
              isObscure: controller.isConfirmPasswordHidden.value,

              textInputAction: TextInputAction.done,
            ),
          ),
        ),
      ],
    );
  }

  /// reusable Method for field labels and sized box widgets
  Widget _buildField({
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.medium,
        ),
        5.height,
        child,
      ],
    );
  }


  /// register button method
  Widget _buildRegisterButton() {
    return CustomButton(
      text: 'Register',
      onTap: controller.register,
    );
  }

  /// Already have an account and goto login screen method (Redirected to Login screen)
  Widget _buildLoginRedirect() {
    return                 Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          2.width,
          GestureDetector(
            onTap: controller.gotoLoginScreen,
            child: Text(
              "Login",
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.fontBodyMedium
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SignUp with google directly Method
  Widget _buildGoogleButton() {
    return CustomButton(
      onTap: controller.signUpWithGoogle,
      image: Image.asset(
        AppIconsAssets.googleIcon,
        height: 28.h,
      ),
      text: 'Sign up with Google',
      backgroundColor: Colors.transparent,
      isSecondary: true,
      isOutlined: true,
    );
  }
}