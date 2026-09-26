import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedCategory = 'Men'.obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  final List<String> categoryList = [
    'Men', 'Women', 'Kids', 'Accessories'
  ];


  // CHANGED: Popup menu open/close state GetX se manage hogi
  final isMenuOpen = false.obs;

  // CHANGED: Menu open hone par state update
  void onMenuOpened() {
    isMenuOpen.value = true;
  }

  // CHANGED: Menu close/cancel hone par state update
  void onMenuClosed() {
    isMenuOpen.value = false;
  }
}