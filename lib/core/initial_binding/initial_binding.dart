import 'package:get/get.dart';
import 'package:shopping_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:shopping_app/feature/splash/controller/splash_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
    Get.put<DashboardController>(DashboardController(), permanent: true);
  }

}