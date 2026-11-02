import 'package:get/get.dart';
import 'package:shopping_app/feature/top_selling/controller/top_selling_controller.dart';

class TopSellingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopSellingController>(()=>TopSellingController());
  }
}