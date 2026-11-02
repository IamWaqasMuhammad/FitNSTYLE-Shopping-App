
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

import '../../../core/common_widgets/custom_button.dart';
import '../../../core/common_widgets/custom_text_field.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../controller/profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CHANGED: Improved top bar with consistent alignment.
              Row(
                children: [
                  CustomButton(
                    onTap: () => Get.back(),
                    height: 40.w,
                    width: 40.w,
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 18.sp,
                      color: AppColors.black,
                    ),
                    backgroundColor: AppColors.lightGrey,
                    isSecondary: true,
                    borderRadius: AppSizes.radiusCircular,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: AppTextStyles.semiBoldLarge,
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Save',
                    width: 70.w,
                    height: 34.h,
                    textColor: AppColors.white,
                    backgroundColor: AppColors.primary,
                    onTap: () {
                      // TODO: Connect profile save functionality.
                    },
                  ),
                ],
              ),

              30.height,

              // CHANGED: Profile image with clean border and camera action.
              Center(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 48.r,
                            backgroundColor: AppColors.lightGrey,
                            child: Icon(
                              CupertinoIcons.person_fill,
                              size: 40.sp,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CustomButton(
                            width: 32.w,
                            height: 32.h,
                            onTap: () {
                              // TODO: Connect image picker.
                            },
                            icon: Icon(
                              CupertinoIcons.camera_fill,
                              color: AppColors.white,
                              size: 15.sp,
                            ),
                            borderRadius: AppSizes.radiusCircular,
                            backgroundColor: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    12.height,
                    Text(
                      'Change Profile Photo',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              30.height,

              // CHANGED: Organized form section.
              Text(
                'Personal Information',
                style: AppTextStyles.headingSmall,
              ),
              6.height,
              Text(
                'Update your personal details below.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textLight,
                ),
              ),

              22.height,

              _buildFieldLabel('Full Name'),
              8.height,
              const CustomTextField(
                hintText: 'Waqas DevelopeR',
                prefixIcon: Icon(CupertinoIcons.person),
                keyboardType: TextInputType.name,
              ),

              18.height,

              _buildFieldLabel('Email Address'),
              8.height,
              const CustomTextField(
                hintText: 'waqasdev@gmail.com',
                prefixIcon: Icon(CupertinoIcons.mail),
                keyboardType: TextInputType.emailAddress,
              ),

              18.height,

              _buildFieldLabel('Password'),
              8.height,
              const CustomTextField(
                hintText: 'Enter your password',
                prefixIcon: Icon(CupertinoIcons.lock),
                keyboardType: TextInputType.visiblePassword,
              ),

              25.height,

              // CHANGED: Gender selector with consistent card design.
              _buildFieldLabel('Gender'),
              8.height,
              Obx(
                    () => InkWell(
                  borderRadius: BorderRadius.circular(
                    AppSizes.radiusMD,
                  ),
                  onTap: () {
                    controller.showGenderSelection(
                      context: context,
                      selectedGender: controller.gender.value,
                      onSelected: controller.updateGender,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(
                        AppSizes.radiusMD,
                      ),
                    ),
                    child: Row(
                      children: [
                        // 🟢 FIXED: Ab error khatam ho gaya hai, controller direct right icon return karega
                        Icon(
                          controller.getGenderIcon(controller.gender.value),
                          color: AppColors.primary,
                          size: 26.sp,
                        ),
                        12.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textLight,
                                  fontSize: 11.sp,
                                ),
                              ),
                              4.height,
                              Text(
                                controller.gender.value,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 16.sp,
                          color: AppColors.textLight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              35.height,

              // CHANGED: Secondary footer styling.

            ],
          ),
        ),
      ),
    );
  }

  // CHANGED: Reusable form field label.
  Widget _buildFieldLabel(String title) {
    return Text(
      title,
      style: AppTextStyles.medium.copyWith(
        color: AppColors.black,
      ),
    );
  }
}
