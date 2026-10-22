import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_image_assets.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';
import 'package:shopping_app/feature/cart/controller/shopping_cart_controller.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShoppingCartController>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.md,
                vertical: 8.h,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomButton(
                  onTap: Get.back,
                  height: 40.w,
                  width: 40.w,
                  icon: const Icon(CupertinoIcons.back),
                  backgroundColor: AppColors.lightGrey,
                  isSecondary: true,
                  borderRadius: AppSizes.radiusCircular,
                ),
              ),
            ),
            Expanded(
              // CHANGED: Show loading, error, empty, and populated cart states.
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }
                if (controller.errorMessage.value != null) {
                  return _buildErrorState(controller);
                }
                if (controller.items.isEmpty) return _buildEmptyState();
                return _buildCart(controller);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(ShoppingCartController controller) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              controller.errorMessage.value!,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
            16.height,
            CustomButton(
              onTap: controller.reloadCart,
              text: 'Try Again',
              width: 160.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImageAssets.shoppingBagImg,
              height: 150.h,
              width: 150.w,
              fit: BoxFit.contain,
            ),
            16.height,
            Text(
              'Your cart is Empty!',
              style: AppTextStyles.semiBoldLarge,
              textAlign: TextAlign.center,
            ),
            30.height,
            CustomButton(
              onTap: () => Get.toNamed(AppRoutes.category),
              text: 'Explore Categories',
              width: 180.w,
              borderRadius: AppSizes.radiusXXL,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCart(ShoppingCartController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Cart (${controller.itemCount} items)',
              style: AppTextStyles.headingMedium,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(AppSizes.md),
            itemCount: controller.items.length,
            separatorBuilder: (context, index) => 12.height,
            itemBuilder: (context, index) =>
                _buildCartItem(controller, controller.items[index]),
          ),
        ),
        _buildSummary(controller),
      ],
    );
  }

  Widget _buildCartItem(
    ShoppingCartController controller,
    PersistentShoppingCartItem item,
  ) {
    final image = item.productThumbnail;
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: image == null || image.isEmpty
                ? _imagePlaceholder()
                : Image.network(
                    image,
                    height: 88.h,
                    width: 76.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _imagePlaceholder(),
                  ),
          ),
          12.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.semiBoldSmall,
                ),
                6.height,
                Text(
                  'Unit: ${_formatPrice(item.unitPrice)}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                4.height,
                Text(
                  'Line total: ${_formatPrice(item.totalPrice)}',
                  style: AppTextStyles.bodySmall,
                ),
                8.height,
                Row(
                  children: [
                    _quantityButton(
                      icon: CupertinoIcons.minus,
                      label: 'Decrease quantity',
                      onTap: () => controller.decreaseQuantity(item.productId),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        '${item.quantity}',
                        style: AppTextStyles.semiBold,
                      ),
                    ),
                    _quantityButton(
                      icon: CupertinoIcons.plus,
                      label: 'Increase quantity',
                      onTap: () => controller.increaseQuantity(item.productId),
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'Remove ${item.productName}',
                      onPressed: () => controller.removeProduct(item.productId),
                      icon: const Icon(
                        CupertinoIcons.trash,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      height: 88.h,
      width: 76.w,
      color: AppColors.surface,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: AppColors.textLight,
        size: 24.sp,
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: SizedBox(
          height: 36.w,
          width: 36.w,
          child: Icon(icon, size: 16.sp, semanticLabel: label),
        ),
      ),
    );
  }

  Widget _buildSummary(ShoppingCartController controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(AppSizes.md, 16.h, AppSizes.md, 20.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Subtotal', style: AppTextStyles.semiBold),
          Text(
            _formatPrice(controller.subtotal),
            style: AppTextStyles.semiBold.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double amount) => '\$${amount.toStringAsFixed(2)}';
}
