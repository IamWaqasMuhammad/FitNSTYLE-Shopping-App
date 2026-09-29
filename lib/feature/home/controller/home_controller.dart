import 'package:get/get.dart';

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

  final isMenuOpen = false.obs;

  void onMenuOpened() {
    isMenuOpen.value = true;
  }

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


  // Dummy product List of top selling
  final List<Map<String, dynamic>> dummyProducts = [
    {
      'title': 'Classic Oversized Cotton T-Shirt',
      'image': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
      'price': '\$29.99',
      'isFavorite': true,
    },
    {
      'title': 'Premium Slim Fit Denim Jeans',
      'image': 'https://images.unsplash.com/photo-1542272604-787c3835535d',
      'price': '\$49.99',
      'isFavorite': false,
    },
    {
      'title': 'Casual Linen Button-Down Shirt',
      'image': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
      'price': '\$35.50',
      'isFavorite': false,
    },
    {
      'title': 'Urban Streetwear Fleece Hoodie',
      'image': 'https://images.unsplash.com/photo-1556821840-3a63f95609a7',
      'price': '\$45.00',
      'isFavorite': true,
    },
    {
      'title': 'Minimalist Waterproof Backpack',
      'image': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
      'price': '\$59.99',
      'isFavorite': false,
    },
    {
      'title': 'Vintage Leather Bomber Jacket',
      'image': 'https://images.unsplash.com/photo-1551028719-00167b16eac5',
      'price': '\$89.99',
      'isFavorite': false,
    },
    {
      'title': 'Lightweight Retro Running Shoes',
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      'price': '\$75.00',
      'isFavorite': true,
    },
    {
      'title': 'Classic Leather Strap Watch',
      'image': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
      'price': '\$120.00',
      'isFavorite': false,
    },
  ];

}