import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_search_bar.dart';
import 'package:shopping_app/core/common_widgets/section_header.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_icons_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/feature/home/controller/home_controller.dart';

import '../../../core/common_widgets/categories_shimmer_loading.dart';
import '../../../core/common_widgets/custom_list_view.dart';
import '../../../core/common_widgets/custom_popup_menu.dart';
import '../../../core/common_widgets/products_grid.dart';
import '../../../core/utils/routes/app_routes.dart';
import '../widgets/categories_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================== APP BAR SECTION ====================
              Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 125.w),
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(AppSizes.radiusLG),
                    ),
                    child: Obx(
                      () => CustomPopupMenu(
                        label: controller.selectedMenuCategory.value,
                        items: controller.menuCategoryList,
                        selectedItem: controller.selectedMenuCategory.value,
                        onSelected: controller.changeMenu,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'FitNSTYLE',
                      maxLines: 1,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: CustomButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.shoppingCart);
                      },
                      icon: Image.asset(
                        AppIconsAssets.shoppingBagIcon,
                        height: 20.h,
                        width: 20.w,
                      ),
                      height: 44.h,
                      width: 44.w,
                      borderRadius: AppSizes.radiusCircular,
                    ),
                  ),
                ],
              ),
              25.height,

              // ==================== SEARCH BAR SECTION ====================
              CustomSearchBar(
                autofocus: true,
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
              ),
              25.height,

              // ==================== CATEGORIES SECTION ====================
              SectionHeader(
                title: 'Categories',
                onSeeAllTap: () {
                  Get.toNamed(AppRoutes.category);
                },
              ),
              10.height,
              SizedBox(
                height: 95.h,
                child: Obx(() {
                  if (controller.isCategoriesLoading.value) {
                    return const CategoriesShimmerLoading(); // ADDED HERE
                  }

                  return CustomListView(
                    scrollDirection: Axis.horizontal,
                    separatorHeight: 12.h,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.categories.length > 6
                        ? 6
                        : controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return CategoryItem(
                        title: category['name']!,
                        image: category['image']!,
                        onTap: () {
                          debugPrint('Selected category: ${category['name']}');
                        },
                      );
                    },
                  );
                }),
              ),
              25.height,

              // ==================== TOP SELLING (DYNAMIC FILTERED) ====================
              SectionHeader(title: 'Top Selling', onSeeAllTap: () {Get.toNamed(AppRoutes.topSelling);}),
              10.height,

              Obx(() {
                final selectedTab = controller.selectedMenuCategory.value
                    .toLowerCase();
                final filteredList = controller.dummyProducts
                    .where(
                      (p) =>
                          p['genderCategory'].toString().toLowerCase() ==
                          selectedTab,
                    )
                    .toList();

                return ProductsGrid(
                  isLoading: controller.isGridLoading.value,
                  products: filteredList,
                  maxItems: 2,
                  onProductTap: (index) {
                    Get.toNamed(
                      AppRoutes.productDetail,
                      arguments: filteredList[index],
                    );
                  },
                );
              }),
              25.height,

              // ==================== NEW IN (DYNAMIC FILTERED) ====================
              SectionHeader(
                title: 'New In',
                titleColor: AppColors.primary,
                titleFontSize: 22.sp,
                onSeeAllTap: () {Get.toNamed(AppRoutes.newIn);},
              ),
              10.height,

              Obx(() {
                final selectedTab = controller.selectedMenuCategory.value
                    .toLowerCase();
                final filteredList = controller.dummyProducts
                    .where(
                      (p) =>
                          p['genderCategory'].toString().toLowerCase() ==
                          selectedTab,
                    )
                    .toList();

                final reversedList = filteredList.reversed.toList();

                return ProductsGrid(
                  isLoading: controller.isGridLoading.value,
                  products: reversedList,
                  maxItems: 4,
                  onProductTap: (index) {
                    Get.toNamed(
                      AppRoutes.productDetail,
                      arguments: reversedList[index],
                    );
                  },
                );
              }),
              25.height,
            ],
          ),
        ),
      ),
    );
  }
}
