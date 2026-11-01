
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';

import '../controller/notifications_controller.dart';

class NotificationItemCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;

  const NotificationItemCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isUnread = !notification.isRead;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: isUnread
                ? AppColors.primary.withValues(alpha: 0.20)
                : AppColors.lightGrey,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.035),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CHANGED: Premium notification icon container.
            Container(
              height: 49.h,
              width: 49.w,
              decoration: BoxDecoration(
                color: notification.color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Icon(
                notification.icon,
                color: notification.color,
                size: 23.sp,
              ),
            ),

            13.horizontalSpace,

            // CHANGED: Notification information.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.semiBoldSmall.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),

                      if (isUnread)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            'NEW',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),

                  7.verticalSpace,

                  Text(
                    notification.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textLight,
                      height: 1.5,
                      fontSize: 11.sp,
                    ),
                  ),

                  11.verticalSpace,

                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 12.sp,
                        color: AppColors.textLight,
                      ),
                      5.horizontalSpace,
                      Text(
                        notification.time,
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      if (isUnread)
                        Container(
                          height: 7.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
