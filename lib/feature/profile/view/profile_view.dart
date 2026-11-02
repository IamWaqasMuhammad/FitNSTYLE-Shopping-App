
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_list_tile.dart';
import 'package:shopping_app/core/common_widgets/custom_snack_bar.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.md),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CHANGED: Clean centered profile header.
            Center(
              child: Column(
                children: [
                  Text(
                    'My Profile',
                    style: AppTextStyles.headingLarge,
                  ),
                  25.height,
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
                      radius: 43.r,
                      backgroundColor: AppColors.lightGrey,
                      child: Icon(
                        CupertinoIcons.person_fill,
                        size: 38.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  16.height,
                  Text(
                    'Manage your account details!',
                    style: AppTextStyles.headingSmall,
                  ),

                ],
              ),
            ),

            10.height,

            // CHANGED: Improved profile information card.
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(
                  AppSizes.radiusMD,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Waqas DevelopeR',
                          style: AppTextStyles.headingSmall,
                        ),
                        7.height,
                        _buildProfileDetail(
                          CupertinoIcons.mail,
                          'waqasdev@gmail.com',
                        ),
                        6.height,
                        _buildProfileDetail(
                          CupertinoIcons.phone,
                          '0301-1234567',
                        ),
                      ],
                    ),
                  ),
                  8.width,
                  CustomButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.editProfile);
                    },
                    text: 'Edit',
                    height: 32.h,
                    width: 65.w,
                    textColor: AppColors.black,
                    backgroundColor: Colors.transparent,
                    isSecondary: true,
                    isOutlined: true,
                  ),
                ],
              ),
            ),

            28.height,

            // CHANGED: Account section.
            _buildSectionTitle('Account'),
            12.height,
            _buildMenuItem(
              icon: CupertinoIcons.location,
              title: 'Address',
              onTap: () {
                CustomSnackBar.showInfo(title: 'Add Address', message: 'This feature will be available soon.');
              },
            ),
            10.height,
            _buildMenuItem(
              icon: CupertinoIcons.heart,
              title: 'Wishlist',
              onTap: () {
                Get.toNamed(AppRoutes.wishlist);
              },
            ),

            25.height,

            // CHANGED: Preferences section.
            _buildSectionTitle('Preferences'),
            12.height,
            _buildMenuItem(
              icon: CupertinoIcons.creditcard,
              title: 'Payment Methods',
              onTap: () {
                Get.toNamed(AppRoutes.paymentMethod);
              },
            ),
            10.height,
            _buildMenuItem(
              icon: CupertinoIcons.settings,
              title: 'Settings',
              onTap: () {Get.toNamed(AppRoutes.settings);},
            ),

            25.height,

            // CHANGED: Support section.
            _buildSectionTitle('Support'),
            12.height,
            _buildMenuItem(
              icon: CupertinoIcons.question_circle,
              title: 'Help & Support',
              onTap: () {
                Get.toNamed(AppRoutes.helpSupport);
              },
            ),

            50.height,
            Center(
              child: Text(
                'Design & Develop by WAQAS - DEVELOPER',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textLight,
                ),
              ),
            ),

            12.height,
          ],
        ),
      ),
    );
  }

  // CHANGED: Reusable profile detail row.
  Widget _buildProfileDetail(IconData icon, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14.sp,
          color: AppColors.textLight,
        ),
        7.width,
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textLight,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // CHANGED: Reusable section heading.
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.headingSmall,
    );
  }

  // CHANGED: Reusable menu tile using existing CustomListTile.
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return CustomListTile(
      height: 52.h,
      backgroundColor: AppColors.lightGrey,
      leadingIcon: Icon(
        icon,
        color: AppColors.primary,
        size: 20.sp,
      ),
      text: title,
      trailingIcon: Icon(
        CupertinoIcons.chevron_right,
        color: AppColors.textLight,
        size: 16.sp,
      ),
      onTap: onTap,
    );
  }
}
