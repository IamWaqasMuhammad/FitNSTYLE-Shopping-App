import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';
import 'package:shopping_app/feature/auth/widgets/forget_password_bottom_sheet.dart';

class AuthController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

   var isPasswordHidden = true.obs;
   var isLoggingIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  /// Triggers user credential payload matching verification requests against your platform endpoints
  void loginUser() async {
    if (isLoggingIn.value) return;
    isLoggingIn.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoggingIn.value = false;
    Get.offAllNamed(AppRoutes.dashboard);

  }

  void continueWithGoogle() async {
  }

  // =========================================================
  // NAVIGATION ROUTING LAYER HOOKS
  // =========================================================
  void gotoRegisterScreen() {
    Get.toNamed(AppRoutes.register);
  }

  void gotoLoginScreen() {
    Get.toNamed(AppRoutes.login);
  }

  void showForgetBottomSheet() {
    ForgotPasswordSheet.show();
  }
}
