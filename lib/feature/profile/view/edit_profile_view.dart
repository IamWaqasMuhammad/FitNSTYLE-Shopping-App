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
import '../../../core/utils/routes/app_routes.dart';
import '../controller/profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onTap: () {
                            Get.offNamed(AppRoutes.dashboard);
                          },
                          height: 40.w,
                          width: 40.w,
                          icon: const Icon(CupertinoIcons.back),
                          backgroundColor: AppColors.lightGrey,
                          isSecondary: true,
                          borderRadius: AppSizes.radiusCircular,
                        ),
                        Text(
                          'Edit Profile',
                          style: AppTextStyles.semiBoldLarge,
                        ),
                        CustomButton(
                          text: 'Save',
                          width: 70.w,
                          height: 30.h,
                          textColor: AppColors.primary,
                          backgroundColor: Colors.transparent,
                          isSecondary: true,
                          onTap: () {},
                        ),
                      ],
                    ),
                    20.height,

                    // Profile Image Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primary,
                              maxRadius: 50,
                              child: Icon(
                                CupertinoIcons.person,
                                size: 40.h,
                                color: AppColors.surface,
                              ),
                            ),
                            Positioned(
                              left: 75.w,
                              top: 75.h,
                              child: CustomButton(
                                width: 30.w,
                                height: 30.h,
                                onTap: () {},
                                icon: Icon(
                                  CupertinoIcons.camera,
                                  color: AppColors.white,
                                  size: 15.r,
                                ),
                                borderRadius: 50.r,
                                backgroundColor: AppColors.accent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.height,

                    // Name Field
                    Text('Name', style: AppTextStyles.medium),
                    5.height,
                    const CustomTextField(
                      hintText: 'Waqas DevelopeR',
                      prefixIcon: Icon(Icons.person_outline),
                      keyboardType: TextInputType.name,
                    ),
                    20.height,

                    // Email Field
                    Text('Email', style: AppTextStyles.medium),
                    5.height,
                    const CustomTextField(
                      hintText: 'waqasdev@gmail.com',
                      prefixIcon: Icon(CupertinoIcons.mail),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    20.height,

                    // Password Field
                    Text('Password', style: AppTextStyles.medium),
                    5.height,
                    const CustomTextField(
                      hintText: '*********',
                      prefixIcon: Icon(CupertinoIcons.lock),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    20.height,

                    // Gender ListTile
                    Obx(
                      () => ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 4.h,
                        ),
                        leading: const Icon(Icons.person_outline),
                        title: const Text('Gender'),
                        subtitle: Text(controller.gender.value),
                        trailing: const Icon(Icons.chevron_right),
                        tileColor: AppColors.surfaceSecondary,
                        focusColor: AppColors.accentLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        onTap: () {
                          controller.showGenderSelection(
                            context: context,
                            selectedGender: controller.gender.value,
                            onSelected: controller.updateGender,
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    20.height,
                    // Footer Text
                    Center(
                      child: Text(
                        'Design & Develop by WAQAS DEVELOPER',
                        style: AppTextStyles.labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
