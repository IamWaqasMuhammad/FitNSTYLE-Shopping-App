
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common_widgets/custom_alert_dialog.dart';
import '../../../core/common_widgets/custom_snack_bar.dart';
import '../../../core/constants/app_colors.dart';

// CHANGED: Notification data model.
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
  final bool isRead;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
    this.isRead = false,
  });

  // CHANGED: Create updated notification without mutating original.
  NotificationItem copyWith({
    bool? isRead,
  }) {
    return NotificationItem(
      id: id,
      title: title,
      message: message,
      time: time,
      icon: icon,
      color: color,
      isRead: isRead ?? this.isRead,
    );
  }
}

class NotificationsController extends GetxController {
  // CHANGED: Reactive notifications list.
  final RxList<NotificationItem> notifications =
      <NotificationItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSampleNotifications();
  }

  // CHANGED: Temporary sample notifications.
  void loadSampleNotifications() {
    notifications.assignAll([
      NotificationItem(
        id: '1',
        title: 'Order Confirmed!',
        message:
        'Your order #FS10245 has been placed successfully.',
        time: '2 minutes ago',
        icon: Icons.shopping_bag_outlined,
        color: AppColors.info,
      ),
      NotificationItem(
        id: '2',
        title: 'Order Shipped',
        message:
        'Your order #FS10240 is on its way. Track your order now.',
        time: '1 hour ago',
        icon: Icons.local_shipping_outlined,
        color: AppColors.accent,
      ),
      NotificationItem(
        id: '3',
        title: 'Special Offer!',
        message:
        'Enjoy exclusive discounts on your favorite collection.',
        time: 'Yesterday',
        icon: Icons.local_offer_outlined,
        color: AppColors.primary,
      ),
      NotificationItem(
        id: '4',
        title: 'Order Delivered',
        message:
        'Your order #FS10230 has been delivered successfully.',
        time: '2 days ago',
        icon: Icons.check_circle_outline,
        color: AppColors.success,
        isRead: true,
      ),
    ]);
  }

  // CHANGED: Total unread notification count.
  int get unreadCount {
    return notifications.where((item) => !item.isRead).length;
  }

  // CHANGED: Mark a single notification as read.
  void markAsRead(String id) {
    final index = notifications.indexWhere(
          (item) => item.id == id,
    );

    if (index == -1 || notifications[index].isRead) return;

    notifications[index] =
        notifications[index].copyWith(isRead: true);
  }

  // CHANGED: Mark all notifications as read.
  void markAllAsRead() {
    notifications.assignAll(
      notifications.map(
            (item) => item.copyWith(isRead: true),
      ),
    );

    CustomSnackBar.showSuccess(
      title: 'Notifications',
      message: 'All notifications marked as read.',
    );
  }

  // CHANGED: Delete a single notification.
  void deleteNotification(String id) {
    final exists = notifications.any(
          (item) => item.id == id,
    );

    if (!exists) return;

    notifications.removeWhere(
          (item) => item.id == id,
    );

    CustomSnackBar.showInfo(
      title: 'Notification Deleted',
      message: 'Notification removed successfully.',
    );
  }

  // CHANGED: Confirmation before clearing all.
  void confirmClearAll() {
    if (notifications.isEmpty) return;

    CustomAlertDialog.show(
      title: 'Clear Notifications',
      message:
      'Are you sure you want to delete all notifications?',
      confirmText: 'Clear All',
      cancelText: 'Cancel',
      isDestructive: true,
      onConfirm: clearAllNotifications,
    );
  }

  // CHANGED: Clear complete notification list.
  void clearAllNotifications() {
    notifications.clear();

    CustomSnackBar.showSuccess(
      title: 'Notifications',
      message: 'All notifications cleared.',
    );
  }
}
