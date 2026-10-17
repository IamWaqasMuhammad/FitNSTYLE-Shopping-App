import 'package:get/get.dart';
import 'package:shopping_app/feature/add_to_cart/controller/add_to_cart_controller.dart';

class AddToCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToCartController>(()=>AddToCartController());
  }
}