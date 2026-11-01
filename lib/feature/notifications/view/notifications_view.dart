import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

import '../controller/notifications_controller.dart';
import '../widgets/notification_item.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            22.verticalSpace,

            // CHANGED: Modern header.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: AppTextStyles.headingLarge.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'Your latest updates and activities',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),

                // CHANGED: Notification count icon.



            24.height,

            // CHANGED: Unread summary section.
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.mark_email_unread_outlined,
                      color: AppColors.white,
                      size: 19.sp,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Text(
                        '${controller.unreadCount} unread notifications',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (controller.unreadCount > 0)
                      GestureDetector(
                        onTap: controller.markAllAsRead,
                        child: Text(
                          'Mark all read',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            23.height,

            // CHANGED: Section title and clear action.
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: AppTextStyles.semiBoldLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                    ),
                  ),

                  if (controller.notifications.isNotEmpty)
                    GestureDetector(
                      onTap: controller.confirmClearAll,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.error,
                            size: 15.sp,
                          ),
                          4.width,
                          Text(
                            'Clear all',
                            style: TextStyle(
                              color: AppColors.error,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            14.verticalSpace,

            // CHANGED: Notification list.
            Expanded(
              child: Obx(() {
                if (controller.notifications.isEmpty) {
                  return _buildEmptyState();
                }

                return ListView.separated(
                  padding: EdgeInsets.only(bottom: 20.h),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.notifications.length,
                  separatorBuilder: (_, _) => 13.verticalSpace,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];

                    return Slidable(
                      key: ValueKey(notification.id),
                      endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        extentRatio: 0.24,
                        dismissible: DismissiblePane(
                          onDismissed: () {
                            controller.deleteNotification(notification.id);
                          },
                        ),
                        children: [
                          SlidableAction(
                            onPressed: (_) {
                              controller.deleteNotification(notification.id);
                            },
                            backgroundColor: AppColors.error,
                            foregroundColor: AppColors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            icon: Icons.delete_outline_rounded,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: NotificationItemCard(
                        notification: notification,
                        onTap: () {
                          controller.markAsRead(notification.id);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // CHANGED: Improved empty state.
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 115.h,
            width: 115.w,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_off_outlined,
              color: AppColors.white,
              size: 48.sp,
            ),
          ),

          22.height,

          Text(
            'All Caught Up!',
            style: AppTextStyles.semiBoldLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),

          9.height,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'You have no notifications right now. '
              'We will let you know when something new happens.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textLight,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
