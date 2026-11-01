import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/loading_overlay.dart'; // Make sure this matches your LoadingOverlayWidget path

import '../../../core/utils/routes/app_routes.dart';
import '../widgets/forget_password_bottom_sheet.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController forgetEmailController;

  final isPasswordHidden = true.obs;
  final isLoggingIn = false.obs;
  final isSending = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    forgetEmailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    forgetEmailController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  // 🟢 FIXED: Login process along with professional GetX async overlay handlers
  Future<void> loginUser() async {
    if (isLoggingIn.value) return;

    Get.showOverlay(
      asyncFunction: () async {
        isLoggingIn.value = true;
        await Future.delayed(const Duration(seconds: 2));
        isLoggingIn.value = false;

        Get.offAllNamed(AppRoutes.dashboard);
      },
      loadingWidget: const LoadingOverlay(loadingMessage: 'Please wait while we Log you In...',),
    );
  }


  void continueWithGoogle() {
    // Google login logic
  }

  void gotoRegisterScreen(){
    Get.offNamed(AppRoutes.register);
  }

  /// Show forget password bottom sheet
  void showForgetBottomSheet() {
    ForgotPasswordSheet.show();
  }

  Future<void> sendResetLink() async {
    if (isSending.value) return;

    isSending.value = true;

    // Firebase password reset logic
    await Future.delayed(const Duration(seconds: 2)); // Placeholder execution segment

    isSending.value = false;
  }
}
