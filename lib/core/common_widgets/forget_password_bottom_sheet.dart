import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_text_field.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

void openForgotPasswordSheet() {
  // GetX context ko use karte huay keyboard height track karne k liye
  final BuildContext context = Get.context!;

  Get.bottomSheet(
    GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Bahar tap karne se keyboard close ho jaye
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: AnimatedPadding(
          // 👈 Yeh main fix hai: Jaise hi keyboard khulega, button automatically upar push ho jayega
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), // Screen resize par scroll overflow se bachata hai
            child: Column(
              mainAxisSize: MainAxisSize.min, // Container ko content k mutabik flexible rakhta hai
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Notch Drag Drag Indicator
                Center(
                  child: Container(
                    width: 40.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                20.height,
                Text('Forgot Password?', style: AppTextStyles.headingMedium),
                8.height,
                Text(
                  'Enter your registered email address to receive a link to reset your account password.',
                  style: AppTextStyles.bodySmall?.copyWith(color: AppColors.textSecondary),
                ),
                24.height,

                // Email Address Input Block
                Text('Email Address', style: AppTextStyles.medium),
                5.height,
                const CustomTextField(
                  hintText: 'waqasdev@gmail.com',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
                32.height,

                // Reset Submission Trigger (Ab kabhi b aadha nazar nahi aayega!)
                CustomButton(
                  text: 'Send Reset Link',
                  onTap: () {
                    Get.back(); // Closes sheet overlay
                  },
                ),
                12.height,
              ],
            ),
          ),
        ),
      ),
    ),
    isScrollControlled: true, // 👈 True hona lazmi hai taake sheet keyboard height ko adapt kar sakay
    barrierColor: AppColors.overlay,
  );
}
