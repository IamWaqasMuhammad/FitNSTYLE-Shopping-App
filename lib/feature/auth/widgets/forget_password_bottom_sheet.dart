import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shopping_app/core/common_widgets/custom_bottom_sheet.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_text_field.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({super.key});

  static void show() {
    CustomBottomSheet.show(
      child: const ForgotPasswordSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnimatedPadding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),

              20.height,

              // Title
              Text(
                'Forgot Password?',
                style: AppTextStyles.headingMedium,
              ),

              8.height,

              // Description
              Text(
                'Enter your registered email address to receive '
                    'a link to reset your account password.',
                style: AppTextStyles.bodySmall,
              ),

              24.height,

              // Email Label
              Text(
                'Email Address',
                style: AppTextStyles.medium,
              ),

              5.height,

              // Email Field
              const CustomTextField(
                hintText: 'waqasdev@gmail.com',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),

              32.height,

              // Button
              CustomButton(
                text: 'Send Reset Link',
                onTap: () {
                  Get.back();

                },
              ),

              12.height,
            ],
          ),
        ),
      ),
    );
  }
}