import 'package:get/get.dart';

class NewInController extends GetxController {
  // CHANGED: Category filter for New In.
  final selectedCategory = 'All'.obs;

  final categories = ['All', 'Men', 'Women', 'Kids'];

  // CHANGED: Static New In products.
  final List<Map<String, dynamic>> products = [
    {
      'id': 7,
      'title': 'Denim Jacket',
      'price': '\$119.00',
      'image':
      'https://images.unsplash.com/photo-1551537482-f2075a1d41f2?w=800&q=80',
      'genderCategory': 'Men',
    },
    {
      'id': 8,
      'title': 'High-Waist Jeans',
      'price': '\$79.00',
      'image':
      'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=800&q=80',
      'genderCategory': 'Women',
    },
    {
      'id': 9,
      'title': 'Kids Striped Hoodie',
      'price': '\$35.00',
      'image':
      'https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=800&q=80',
      'genderCategory': 'Kids',
    },
    {
      'id': 10,
      'title': 'Cashmere Sweater',
      'price': '\$189.00',
      'image':
      'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800&q=80',
      'genderCategory': 'Women',
    },
    {
      'id': 11,
      'title': 'Cargo Pants',
      'price': '\$89.00',
      'image':
      'https://images.unsplash.com/photo-1517438476312-10d79c077509?w=800&q=80',
      'genderCategory': 'Men',
    },
    {
      'id': 12,
      'title': 'Ballet Flats',
      'price': '\$79.00',
      'image':
      'https://images.unsplash.com/photo-1560769629-975ec94e6a86?w=800&q=80',
      'genderCategory': 'Women',
    },
  ];

  // CHANGED: Filter products according to selected category.
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