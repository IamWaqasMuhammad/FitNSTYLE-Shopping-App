import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_image_assets.dart';

class HomeController extends GetxController {

  // ==================== POPUP MENU ====================

  final selectedMenuCategory = 'Men'.obs;
  final List<String> menuCategoryList = [
    'Men',
    'Women',
    'Kids',
    'Accessories',
  ];

  void changeMenuCategory(String category) {
    selectedMenuCategory.value = category;
  }

  // Popup menu open hai ya close.
  final isMenuOpen = false.obs;

  // Popup menu open hone par.
  void onMenuOpened() {
    isMenuOpen.value = true;
  }

  // Popup menu close hone par.
  void onMenuClosed() {
    isMenuOpen.value = false;
  }


  // ==================== HOME CATEGORIES ====================
  final List<Map<String, String>> categories = [
    {
      'name': 'T-Shirts',
      'image':
      'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
    },
    {
      'name': 'Jeans',
      'image':
      'https://images.unsplash.com/photo-1542272604-787c3835535d',
    },
    {
      'name': 'Shirts',
      'image':
      'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf',
    },
    {
      'name': 'Hoodies',
      'image':
      'https://images.unsplash.com/photo-1556821840-3a63f95609a7',
    },
    {
      'name': 'Bags',
      'image':
      'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
    },
    {
      'name': 'Jackets',
      'image':
      'https://images.unsplash.com/photo-1551028719-00167b16eac5',
    },
    {
      'name': 'Shoes',
      'image':
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
    },
    {
      'name': 'Accessories',
      'image':
      'https://images.unsplash.com/photo-1523779917675-b6ed3a42a561',
    },
  ];

}