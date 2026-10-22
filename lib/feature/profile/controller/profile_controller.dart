import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class ProfileController extends GetxController {

  final RxString gender = 'Male'.obs;

  void updateGender(String value) {
    gender.value = value;
  }

  void showGenderSelection({
    required BuildContext context,
    required String selectedGender,
    required ValueChanged<String> onSelected,
  }) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Gender',
                style: AppTextStyles.headingLarge,
              ),
              16.height,

              ...['Male', 'Female', 'Prefer not to say'].map(
                    (gender) {
                  final isSelected = selectedGender == gender;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
                      tileColor: isSelected ? AppColors.accent : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      title: Text(
                        gender,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? AppColors.primary : null,
                        ),
                      ),
                      trailing: Icon(
                        isSelected ? Icons.check_circle : Icons.circle_outlined,
                        color: isSelected ? AppColors.primary : Colors.grey,
                      ),
                      onTap: () {
                        onSelected(gender);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }



  final List<Map<String, dynamic>> profileOptions = [
    {
      'title': 'Address',
      'icon': CupertinoIcons.location,
    },
    {
      'title': 'Notifications',
      'icon': CupertinoIcons.bell,
    },
    {
      'title': 'Settings',
      'icon': Icons.settings_outlined,
    },
    {
      'title': 'Wishlist',
      'icon': CupertinoIcons.heart,
    },
    {
      'title': 'Help & Support',
      'icon': CupertinoIcons.question_circle,
    },
    {
      'title': 'Payments',
      'icon': CupertinoIcons.creditcard,
    },
  ];
}