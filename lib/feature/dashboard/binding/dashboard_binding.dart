import 'package:get/get.dart';
import 'package:shopping_app/feature/dashboard/controller/dashboard_controller.dart';

import '../../home/controller/home_controller.dart';
import '../../notifications/controller/notifications_controller.dart';
import '../../orders/controller/order_controller.dart';
import '../../profile/controller/profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(()=>DashboardController());

    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<NotificationsController>(() => NotificationsController(), fenix: true);
    Get.lazyPut<OrdersController>(() => OrdersController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}