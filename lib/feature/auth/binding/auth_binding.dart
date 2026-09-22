import 'package:get/get.dart';
import 'package:shopping_app/feature/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}