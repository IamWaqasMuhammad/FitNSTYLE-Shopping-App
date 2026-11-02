import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/constants/app_colors.dart';

import '../../../core/common_widgets/custom_grid_card.dart';
import '../controller/top_selling_controller.dart';

class TopSellingView extends StatelessWidget {
  const TopSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TopSellingController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
        ),
        title: Text(
          'Top Selling',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CHANGED: Intro heading.
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Favorites',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Discover the styles everyone is loving.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // CHANGED: Category filter chips.
            SizedBox(
              height: 42.h,
              child: Obx(() {
                // CHANGED: Read observable inside Obx scope.
                final selectedCategory = controller.selectedCategory.value;

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 9.w),
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];

                    // CHANGED: Compare with locally captured observable value.
                    final isSelected = selectedCategory == category;

                    return GestureDetector(
                      onTap: () => controller.changeCategory(category),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 9.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? AppColors.white
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            SizedBox(height: 20.h),

            // CHANGED: Product count and sorting label.
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${controller.filteredProducts.length} Products',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: AppColors.accent,
                          size: 17.sp,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'Popular choices',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 14.h),

            // CHANGED: Responsive two-column product grid.
            Expanded(
              child: Obx(() {
                final products = controller.filteredProducts;

                if (products.isEmpty) {
                  return Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 18.h,
                    childAspectRatio: 159 / 240,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return CustomGridCard(
                      image: product['image'] ?? '',
                      title: product['title'] ?? '',
                      price: product['price'] ?? '',
                      onTap: () {
                        Get.toNamed('/product-detail', arguments: product);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
