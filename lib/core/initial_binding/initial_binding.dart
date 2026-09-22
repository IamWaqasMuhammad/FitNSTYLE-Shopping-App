import 'package:get/get.dart';
import 'package:shopping_app/feature/auth/controller/auth_controller.dart';
import 'package:shopping_app/feature/splash/controller/splash_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }

}