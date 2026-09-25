import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/routes/app_routes.dart';

class RegisterController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isRegistering = false.obs;

  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.toggle();
  }

  Future<void> register() async {
    if (isRegistering.value) return;

    isRegistering.value = true;

    // Registration logic

    isRegistering.value = false;
  }

  void signUpWithGoogle() {
    // Google signup logic
  }

  void gotoLoginScreen(){
    Get.offNamed(AppRoutes.login);
  }
}