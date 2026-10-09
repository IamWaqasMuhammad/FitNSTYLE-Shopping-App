import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_grid_card.dart'; // Apna sahi path confirm kar lein

class ProductsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int? maxItems; // Optional parameter taake home par sirf 2 items dikhayein
  final Function(int index) onFavoriteTap;
  final Function(int index) onProductTap;

  const ProductsGrid({
    super.key,
    required this.products,
    this.maxItems, // Agar ye pass nahi karenge, toh saare products dikhega
    required this.onFavoriteTap,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    final int displayCount = maxItems != null && products.length > maxItems!
        ? maxItems!
        : products.length;

    if (products.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 159 / 240,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return CustomGridCard(
          image: product['image'] ?? '',
          title: product['title'] ?? '',
          price: product['price'] ?? '',
          isFavorite: product['isFavorite'] ?? false,
          onFavoriteTap: () => onFavoriteTap(index),
          onTap: () => onProductTap(index),
        );
      },
    );
  }
}
