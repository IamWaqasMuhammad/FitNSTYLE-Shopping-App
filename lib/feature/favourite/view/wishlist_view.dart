import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_grid_card.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';
import 'package:shopping_app/feature/favourite/controller/wishlist_controller.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WishlistController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSizes.md),
              child: Row(
                children: [
                  CustomButton(
                    onTap: Get.back,
                    height: 40.w,
                    width: 40.w,
                    icon: const Icon(CupertinoIcons.back),
                    backgroundColor: AppColors.lightGrey,
                    isSecondary: true,
                    borderRadius: AppSizes.radiusCircular,
                  ),
                  16.width,
                  Text('My Wishlist', style: AppTextStyles.headingMedium),
                ],
              ),
            ),
            Expanded(
              // CHANGED: The profile wishlist now reflects saved items and clear empty/loading states.
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }
                if (controller.loadError.value != null) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.md),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.loadError.value!,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyMedium,
                          ),
                          16.height,
                          CustomButton(
                            onTap: controller.loadWishlist,
                            text: 'Try Again',
                            width: 160.w,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (controller.products.isEmpty) {
                  return _buildEmptyWishlist();
                }
                return _buildProductGrid(controller);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWishlist() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.heart, size: 76.sp, color: AppColors.primary),
            16.height,
            Text('Your wishlist is empty', style: AppTextStyles.semiBoldLarge),
            24.height,
            CustomButton(
              onTap: () => Get.offNamed(AppRoutes.dashboard),
              text: 'Continue Shopping',
              width: 190.w,
              borderRadius: AppSizes.radiusXXL,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(WishlistController controller) {
    return GridView.builder(
      padding: EdgeInsets.all(AppSizes.md),
      itemCount: controller.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 159 / 240,
      ),
      itemBuilder: (context, index) {
        final product = controller.products[index];
        final productId = product['id'].toString();
        final title = product['title'] as String;
        return Stack(
          children: [
            Positioned.fill(
              child: CustomGridCard(
                image: product['image'] is String
                    ? product['image'] as String
                    : '',
                title: title,
                price: product['price'].toString(),
                onTap: () =>
                    Get.toNamed(AppRoutes.productDetail, arguments: product),
              ),
            ),
            Positioned(
              top: 8.r,
              right: 8.r,
              child: Material(
                color: AppColors.surface,
                shape: const CircleBorder(),
                child: IconButton(
                  tooltip: 'Remove $title from wishlist',
                  onPressed: () => controller.removeProduct(productId),
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.primary,
                    size: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
