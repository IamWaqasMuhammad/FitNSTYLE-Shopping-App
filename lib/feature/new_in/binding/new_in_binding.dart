import 'package:get/get.dart';
import 'package:shopping_app/feature/new_in/controller/new_in_controller.dart';

class NewInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewInController>(()=>NewInController());
  }
}