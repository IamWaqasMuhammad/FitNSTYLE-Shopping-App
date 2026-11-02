import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'custom_grid_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int? maxItems;
  final Function(int index) onProductTap;
  final bool isLoading;

  const ProductsGrid({
    super.key,
    required this.products,
    this.maxItems,
    required this.onProductTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      final int count = maxItems ?? 4;
      return Shimmer.fromColors(
        baseColor: AppColors.lightGrey,
        highlightColor: AppColors.surfaceSecondary,
        period: const Duration(milliseconds: 1500),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 159 / 240, // MATCHES REAL CONTENT CHILD ASPECT RATIO PERFECTLY
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP MOCK IMAGE SPACE
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                10.verticalSpace,
                // MOCK TITLE STRIP
                Container(
                  width: double.infinity,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                8.verticalSpace,
                // MOCK PRICE STRIP
                Container(
                  width: 65.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    if (products.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    final int displayCount = maxItems != null && products.length > maxItems!
        ? maxItems!
        : products.length;

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
          onTap: () => onProductTap(index),
        );
      },
    );
  }
}
