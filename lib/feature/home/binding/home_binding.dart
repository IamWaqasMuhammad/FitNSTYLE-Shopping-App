import 'package:get/get.dart';
import 'package:shopping_app/feature/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController(),fenix: true);
  }
}