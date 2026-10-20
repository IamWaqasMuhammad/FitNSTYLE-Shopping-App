import 'package:get/get.dart';
import 'package:shopping_app/feature/cart/controller/shopping_cart_controller.dart';
import 'package:shopping_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:shopping_app/feature/favourite/controller/wishlist_controller.dart';
import 'package:shopping_app/feature/splash/controller/splash_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
    Get.put<DashboardController>(DashboardController(), permanent: true);
    // CHANGED: Lazily create the persistent cart after package initialization and on first use.
    Get.lazyPut<ShoppingCartController>(
      ShoppingCartController.new,
      fenix: true,
    );
    Get.lazyPut<WishlistController>(WishlistController.new, fenix: true);
  }
}
