
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

import '../../../core/utils/routes/app_routes.dart';
import '../controller/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // CHANGED: Get controller through dependency injection.
    final controller = Get.find<SettingsController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.black,
            size: 22.sp,
          ),
        ),
        title: Text(
          'Settings',
          style: AppTextStyles.headingSmall,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Preferences',
                style: AppTextStyles.headingLarge,
              ),
              6.height,
              Text(
                'Customize your app experience.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textLight,
                ),
              ),

              28.height,

              _buildSectionTitle('General'),
              12.height,

              // CHANGED: Notification state comes from controller.
              Obx(
                    () => _buildSwitchTile(
                  icon: CupertinoIcons.bell,
                  title: 'Notifications',
                  subtitle: 'Receive updates and offers',
                  value: controller.isNotificationEnabled.value,
                  onChanged: controller.updateNotification,
                ),
              ),

              10.height,

              // CHANGED: Dark mode state comes from controller.
              _buildSwitchTile(
                  icon: CupertinoIcons.moon,
                  title: 'Dark Mode',
                  subtitle: 'Change app appearance',
                  value: controller.isDarkModeEnabled.value,
                  onChanged: controller.updateDarkMode,
                ),


              25.height,

              _buildSectionTitle('Preferences'),
              12.height,

              // CHANGED: Language value is reactive.
              _buildNavigationTile(
                  icon: CupertinoIcons.globe,
                  title: 'Language',
                  subtitle: controller.selectedLanguage.value,
                  onTap: (){controller.showComingSoon('Update Language');}

              ),

              10.height,

              _buildNavigationTile(
                icon: CupertinoIcons.money_dollar_circle,
                title: 'Currency',
                subtitle: 'PKR',
                onTap: () {
                  controller.showComingSoon('Currency');
                },
              ),

              25.height,

              _buildSectionTitle('Privacy & Security'),
              12.height,

              _buildNavigationTile(
                icon: CupertinoIcons.lock,
                title: 'Privacy Policy',
                onTap: () {
                  controller.showComingSoon('Privacy Policy');
                },
              ),

              10.height,

              _buildNavigationTile(
                icon: CupertinoIcons.shield_lefthalf_fill,
                title: 'Security',
                onTap: () {
                  controller.showComingSoon('Security');
                },
              ),

              25.height,

              _buildSectionTitle('About'),
              12.height,

              _buildNavigationTile(
                icon: CupertinoIcons.info,
                title: 'About FitNSTYLE',
                subtitle: 'Version 1.0.0',
                onTap: () {
                  Get.toNamed(AppRoutes.about);
                },
              ),

              10.height,

              _buildNavigationTile(
                icon: CupertinoIcons.star,
                title: 'Rate App',
                onTap: () {
                  controller.showComingSoon('Rate App');
                },
              ),

              28.height,

              // CHANGED: Logout confirmation UI.
              InkWell(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                onTap: () => _showLogoutDialog(controller),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(
                      AppSizes.radiusMD,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.square_arrow_right,
                        color: Colors.red,
                        size: 20.sp,
                      ),
                      12.width,
                      Text(
                        'Logout',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              30.height,

              Center(
                child: Text(
                  'FitNSTYLE',
                  style: AppTextStyles.headingSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              5.height,
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),

              15.height,
            ],
          ),
        ),
      ),
    );
  }

  // CHANGED: Reusable section heading.
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.headingSmall,
    );
  }

  // CHANGED: Reusable switch tile.
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: Row(
        children: [
          _buildLeadingIcon(icon),
          12.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyMedium),
                4.height,
                Text(
                  subtitle,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            activeTrackColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  // CHANGED: Reusable navigation tile.
  Widget _buildNavigationTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        ),
        child: Row(
          children: [
            _buildLeadingIcon(icon),
            12.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodyMedium),
                  if (subtitle != null) ...[
                    4.height,
                    Text(
                      subtitle,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              color: AppColors.textLight,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  // CHANGED: Reusable leading icon.
  Widget _buildLeadingIcon(IconData icon) {
    return Container(
      height: 38.h,
      width: 38.w,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(
        icon,
        color: AppColors.primary,
        size: 19.sp,
      ),
    );
  }


  // CHANGED: Logout confirmation dialog.
  void _showLogoutDialog(SettingsController controller) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Logout',
          style: AppTextStyles.headingSmall,
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColors.textLight),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.logout();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
