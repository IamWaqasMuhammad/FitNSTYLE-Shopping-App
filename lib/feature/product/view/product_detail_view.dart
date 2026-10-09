import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? product = Get.arguments;

    if (product == null) {
      return const Scaffold(
        body: Center(child: Text('Product details not available')),
      );
    }

    // 🟢 CHANGED: Extracting the flexible generic size array dynamically from the current routed schema map item
    final List<dynamic> sizeList = product['sizes'] ?? [];

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================== IMAGE HEADER CONTAINER ====================
              Stack(
                children: [
                  Container(
                    height: 380.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
                      child: Image.network(
                        product['image'] ?? '',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator(color: AppColors.primary));
                        },
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.textLight,
                          size: 32.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 16.w,
                    child: CustomButton(
                      onTap: () => Get.back(),
                      height: 40.w,
                      width: 40.w,
                      icon: const Icon(CupertinoIcons.back),
                      backgroundColor: Colors.white,
                      borderRadius: AppSizes.radiusCircular,
                    ),
                  ),
                ],
              ),

              // ==================== METADATA CONTENT INFORMATION ====================
              Padding(
                padding: EdgeInsets.all(AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product['title'] ?? 'Product Title',
                            style: AppTextStyles.headingLarge.copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // 🟢 CHANGED: Added dynamic badge indicator matching product items catalog subratings properties
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(12.r)),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              4.width,
                              Text(
                                '${product['rating'] ?? 0.0}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.amber.shade900),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    12.height,
                    Text(
                      product['price'] ?? '\$0.00',
                      style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    20.height,

                    // 🟢 CHANGED AREA START: Horizontally scrolling selectable structural size chips widgets layout injected
                    if (sizeList.isNotEmpty) ...[
                      Text(
                        'Select Size',
                        style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                      ),
                      12.height,
                      SizedBox(
                        height: 38.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: sizeList.length,
                          separatorBuilder: (context, index) => SizedBox(width: 10.w),
                          itemBuilder: (context, index) {
                            final sizeLabel = sizeList[index].toString();

                            // Testing placeholder configuration mockup (Can be easily linked to a reactive controller value later)
                            final bool isSelectedPlaceholder = index == 0;

                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: isSelectedPlaceholder ? AppColors.textPrimary : AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: isSelectedPlaceholder ? AppColors.textPrimary : Colors.transparent),
                              ),
                              child: Center(
                                child: Text(
                                  sizeLabel,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: isSelectedPlaceholder ? AppColors.surface : AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      20.height,
                    ],
                    // 🟢 CHANGED AREA END

                    Text(
                      'Description',
                      style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                    ),
                    10.height,
                    Text(
                      product['description'] ?? 'No Description available for this item.',
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
                    ),
                    40.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
