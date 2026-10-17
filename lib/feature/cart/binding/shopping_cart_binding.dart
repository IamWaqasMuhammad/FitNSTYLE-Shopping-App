import 'package:get/get.dart';
import 'package:shopping_app/feature/cart/controller/shopping_cart_controller.dart';

class ShoppingCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartController>(()=>ShoppingCartController());
  }
}