import 'package:get/get.dart';

class TopSellingController extends GetxController {
  // CHANGED: Category filter for Top Selling.
  final selectedCategory = 'All'.obs;

  final categories = ['All', 'Men', 'Women', 'Kids'];

  // CHANGED: Static Top Selling products.
  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'title': 'Classic Oxford Shirt',
      'price': '\$59.00',
      'image':
      'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=800&q=80',
      'genderCategory': 'Men',
    },
    {
      'id': 2,
      'title': 'Slim Fit Chinos',
      'price': '\$69.00',
      'image':
      'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=800&q=80',
      'genderCategory': 'Men',
    },
    {
      'id': 3,
      'title': 'Floral Summer Dress',
      'price': '\$89.00',
      'image':
      'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=800&q=80',
      'genderCategory': 'Women',
    },
    {
      'id': 4,
      'title': 'White Sneakers',
      'price': '\$99.00',
      'image':
      'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800&q=80',
      'genderCategory': 'Women',
    },
    {
      'id': 5,
      'title': 'Kids Dinosaur Tee',
      'price': '\$25.00',
      'image':
      'https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=800&q=80',
      'genderCategory': 'Kids',
    },
    {
      'id': 6,
      'title': 'Leather Crossbody Bag',
      'price': '\$149.00',
      'image':
      'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=800&q=80',
      'genderCategory': 'Women',
    },
  ];

  // CHANGED: Products update when category changes.
  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory.value == 'All') {
      return products;
    }

    return products
        .where(
          (product) =>
      product['genderCategory'] == selectedCategory.value,
    )
        .toList();
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
  }
}