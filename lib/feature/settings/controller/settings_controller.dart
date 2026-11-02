
import 'package:get/get.dart';

import '../../../core/common_widgets/custom_alert_dialog.dart';
import '../../../core/common_widgets/custom_snack_bar.dart';

class SettingsController extends GetxController {
  // CHANGED: Reactive settings states.
  final RxBool isNotificationEnabled = true.obs;
  final RxBool isDarkModeEnabled = false.obs;
  final RxString selectedLanguage = 'English'.obs;

  // CHANGED: Notification setting with reusable CustomSnackBar.
  void updateNotification(bool value) {
    isNotificationEnabled.value = value;

    if (value) {
      CustomSnackBar.showSuccess(
        title: 'Notifications',
        message: 'Notifications enabled successfully.',
      );
    } else {
      CustomSnackBar.showInfo(
        title: 'Notifications',
        message: 'Notifications disabled.',
      );
    }
  }

  // CHANGED: Dark mode setting with reusable CustomSnackBar.
  void updateDarkMode(bool value) {
    isDarkModeEnabled.value = value;

    CustomSnackBar.showInfo(
      title: 'Appearance',
      message:
          'Dark Theme will be available soon.',
    );

    // TODO: Connect this setting with the global GetX theme.
  }

  // CHANGED: Language selection with reusable CustomSnackBar.
  void updateLanguage(String language) {
    selectedLanguage.value = language;

    Get.back();

    CustomSnackBar.showSuccess(
      title: 'Language Updated',
      message: 'Change Language will be available soon.',
    );

    // TODO: Connect this setting with GetX localization.
  }

  // CHANGED: Reusable info message for upcoming features.
  void showComingSoon(String feature) {
    CustomSnackBar.showInfo(
      title: feature,
      message: 'This feature will be available soon.',
    );
  }

  // CHANGED: Logout confirmation using CustomAlertDialog.
  void confirmLogout() {
    CustomAlertDialog.show(
      title: 'Logout',
      message: 'Are you sure you want to logout?',
      confirmText: 'Logout',
      cancelText: 'Cancel',
      isDestructive: true,
      onConfirm: logout,
    );
  }

  // CHANGED: Logout action after confirmation.
  void logout() {
    // TODO: Connect your Firebase/API authentication logout here.

    CustomAlertDialog.show(
      title: 'Logout',
      message:
      'Authentication logout is not connected yet.',
      confirmText: 'Logout',
      cancelText: 'Cancel',
      isDestructive: true,
      onConfirm: () { Get.back(); },
    );
  }
}
