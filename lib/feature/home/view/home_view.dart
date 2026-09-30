import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/section_header.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_icons_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/feature/home/controller/home_controller.dart';

import '../../../core/common_widgets/custom_list_view.dart';
import '../../../core/common_widgets/custom_popup_menu.dart';
import '../../../core/common_widgets/custom_text_field.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person, color: AppColors.surface),
                  ),
                  Obx(
                    () => Container(
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
                      ),
                      child: Center(
                        child: CustomPopupMenu(
                          label: controller.selectedMenuCategory.value,
                          items: controller.menuCategoryList,
                          selectedItem: controller.selectedMenuCategory.value,
                          onSelected: controller.changeMenuCategory,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    onTap: () {},
                    icon: Image.asset(
                      AppIconsAssets.shoppingBagIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                    height: 50.h,
                    width: 50.w,
                    borderRadius: AppSizes.radiusCircular,
                  ),
                ],
              ),
              25.height,
              CustomTextField(
                hintText: 'Search',
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: AppColors.textLight,
                ),
                keyboardType: TextInputType.text,
              ),
              25.height,
              SectionHeader(title: 'Categories', onSeeAllTap: () {Get.toNamed(AppRoutes.category);debugPrint('Tapped');}),
              10.height,
              SizedBox(
                height: 95.h,
                child: CustomListView(
                  scrollDirection: Axis.horizontal,
                  separatorHeight: 12.h,
                  shrinkWrap: true,
                  // CHANGED: Nested scroll conflicts se bachne ke liye list ka scroll block kiya kyunki parent scroll view pehle se scrollable hai
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.categories.length > 6?6:controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];

                    // 🟢 CHANGED: Expanded widget ko yahan se hata diya hai taake parent data assertion crash khatam ho jaye
                    return CategoryItem(
                      title: category['name']!,
                      image: category['image']!,
                      onTap: () {
                        debugPrint(
                          'Selected category: ${category['name']}',
                        );
                      },
                    );
                  },
                ),
              ),
              25.height,
              SectionHeader(title: 'Top Selling', onSeeAllTap: () {}),
              10.height,

              ProductsGrid(
                products: controller.dummyProducts,
                maxItems: controller.dummyProducts.length > 2
                    ? 2
                    : controller.dummyProducts.length,
                onFavoriteTap: (index) {
                  final product = controller.dummyProducts[index];
                  debugPrint('Toggled favorite for: ${product['title']}');
                },
                onProductTap: (index) {
                  final product = controller.dummyProducts[index];
                  debugPrint(
                    'Navigating to details page for: ${product['title']}',
                  );
                },
              ),

              25.height,
              SectionHeader(
                title: 'New In',
                titleColor: AppColors.primary,
                titleFontSize: 22.sp,
                onSeeAllTap: () {},
              ),
              10.height,
              ProductsGrid(
                products: controller.dummyProducts,
                maxItems: controller.dummyProducts.length > 4
                    ? 4
                    : controller.dummyProducts.length,
                onFavoriteTap: (index) {
                  final product = controller.dummyProducts[index];
                  debugPrint('Toggled favorite for: ${product['title']}');
                },
                onProductTap: (index) {
                  final product = controller.dummyProducts[index];
                  debugPrint(
                    'Navigating to details page for: ${product['title']}',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
