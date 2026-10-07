import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_list_tile.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.height,
          Center(
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              maxRadius: 50,
              child: Icon(
                CupertinoIcons.person,
                size: 40.h,
                color: AppColors.surface,
              ),
            ),
          ),
          20.height,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Waqas DevelopeR',
                        style: AppTextStyles.headingSmall,
                      ),
                      3.height,
                      Text(
                        'waqasdev@gmail.com',
                        style: AppTextStyles.bodyMedium,
                      ),
                      3.height,
                      Text('0301-1234567', style: AppTextStyles.bodyMedium),
                    ],
                  ),
                  CustomButton(onTap: () {}, text: 'Edit',
                  height: 30.h,
                    width: 70.w,
                    textColor: AppColors.black,
                    backgroundColor: Colors.transparent,
                    isSecondary: true,
                  ),
                ],
              ),
            ),
          ),
          20.height,
          Container(
            height: 400.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.sm),
                child: Column(
                  children: [
                    10.height,
                    CustomListTile(
                      height: 70.h,
                      backgroundColor: AppColors.grey,
                      leadingIcon: Icon(CupertinoIcons.location),
                      text: 'Address',
                      trailingIcon: Icon(CupertinoIcons.arrow_right),
                    ),
                    10.height,
                    CustomListTile(
                      height: 70.h,
                      backgroundColor: AppColors.grey,
                      leadingIcon: Icon(CupertinoIcons.bell),
                      text: 'Notifications',
                      trailingIcon: Icon(CupertinoIcons.arrow_right),
                    ),
                    10.height,
                    CustomListTile(
                      height: 70.h,
                      backgroundColor: AppColors.grey,
                      leadingIcon: Icon(Icons.settings_outlined),
                      text: 'Settings',
                      trailingIcon: Icon(CupertinoIcons.arrow_right),
                    ),
                    10.height,
                    CustomListTile(
                      height: 70.h,
                      backgroundColor: AppColors.grey,
                      leadingIcon: Icon(CupertinoIcons.heart),
                      text: 'Wishlist',
                      trailingIcon: Icon(CupertinoIcons.arrow_right),
                    ),
                    10.height,
                    CustomListTile(
                      height: 70.h,
                      backgroundColor: AppColors.grey,
                      leadingIcon: Icon(CupertinoIcons.question_circle),
                      text: 'Help & Support',
                      trailingIcon: Icon(CupertinoIcons.arrow_right),
                    ),
                    10.height,
                    CustomListTile(
                      height: 70.h,
                      backgroundColor: AppColors.grey,
                      leadingIcon: Icon(CupertinoIcons.creditcard),
                      text: 'Payments',
                      trailingIcon: Icon(CupertinoIcons.arrow_right),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
