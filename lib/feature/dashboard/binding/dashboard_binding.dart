import 'package:get/get.dart';
import 'package:shopping_app/feature/dashboard/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(()=>DashboardController());
  }
}