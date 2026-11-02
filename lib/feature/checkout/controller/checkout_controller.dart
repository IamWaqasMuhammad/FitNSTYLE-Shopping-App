
import 'package:get/get.dart';

import '../../../core/common_widgets/custom_snack_bar.dart';
import '../../../core/utils/routes/app_routes.dart';

class CheckoutController extends GetxController {
  // CHANGED: Default selected payment method.
  final RxString selectedPaymentMethod = 'Cash on Delivery'.obs;

  // CHANGED: Open payment screen and receive selected method.
  Future<void> selectPaymentMethod() async {
    final result = await Get.toNamed(AppRoutes.paymentMethod);

    if (result is String && result.isNotEmpty) {
      selectedPaymentMethod.value = result;
    }
  }

  // CHANGED: Placeholder for order placement.
  void placeOrder() {
    CustomSnackBar.showInfo(
      title: 'Order',
      message: 'Your Order is placed',
    );

    // TODO: Send address, cart items and payment method to backend.
  }
}
