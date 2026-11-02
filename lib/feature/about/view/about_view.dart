
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_icons_assets.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/extensions/sized_box_extension.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
        ),
        title: Text(
          'About FitNSTYLE',
          style: AppTextStyles.semiBoldLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.height,

            // CHANGED: App logo section.
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Image.asset(AppIconsAssets.appIcon,color: AppColors.white,),
            ),

            20.height,

            Text(
              'FitNSTYLE',
              style: AppTextStyles.headingLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),

            8.height,

            Text(
              'Your Style, Your Identity',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textLight,
              ),
            ),

            12.height,

            // CHANGED: Version information.
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 7.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'Version 1.0.0',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),

            30.height,

            // CHANGED: About description card.
            _buildSection(
              title: 'About Us',
              description:
              'FitNSTYLE is a clothing shopping application designed '
                  'to make your shopping experience simple, convenient, '
                  'and enjoyable. Explore different styles and find products '
                  'that match your personality.',
            ),

            16.height,

            _buildSection(
              title: 'Our Mission',
              description:
              'Our mission is to provide a smooth and user-friendly '
                  'shopping experience where customers can explore clothing '
                  'collections and discover their personal style.',
            ),

            16.height,

            // CHANGED: App information.
            _buildInfoTile(
              icon: Icons.shopping_bag_outlined,
              title: 'Application',
              value: 'FitNSTYLE',
            ),

            _buildInfoTile(
              icon: Icons.info_outline_rounded,
              title: 'Version',
              value: '1.0.0',
            ),

            _buildInfoTile(
              icon: Icons.code_rounded,
              title: 'Platform',
              value: 'Flutter',
            ),

            30.height,

            Text(
              'Made with care for your style.',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textLight,
              ),
              textAlign: TextAlign.center,
            ),

            8.height,

            Text(
              '© 2026 FitNSTYLE. All rights reserved.',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textLight,
              ),
              textAlign: TextAlign.center,
            ),

            20.height,
          ],
        ),
      ),
    );
  }

  // CHANGED: Reusable information section.
  Widget _buildSection({
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBoldSmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          10.height,
          Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textLight,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // CHANGED: Reusable app information tile.
  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 22.sp,
          ),
          14.width,
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.medium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Text(
            value,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
