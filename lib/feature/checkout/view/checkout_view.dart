
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_widgets/custom_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../controller/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Checkout',
          style: AppTextStyles.semiBoldLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CHANGED: Delivery address section.
            _buildSectionHeader(
              title: 'Delivery Address',
              action: 'Change',
              onTap: () {
                // TODO: Open saved addresses screen.
              },
            ),
            SizedBox(height: 12.h),

            _buildCard(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                    size: 25.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: AppTextStyles.semiBoldSmall.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Add your delivery address',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15.sp,
                    color: AppColors.textLight,
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // CHANGED: Order summary section.
            _buildSectionHeader(
              title: 'Order Summary',
            ),
            SizedBox(height: 12.h),

            _buildCard(
              child: Column(
                children: [
                  _buildPriceRow(
                    'Items',
                    'Your cart items',
                  ),
                  SizedBox(height: 12.h),
                  _buildPriceRow(
                    'Delivery Fee',
                    'Calculated at checkout',
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // CHANGED: Payment method section.
            _buildSectionHeader(
              title: 'Payment Method',
              action: 'Change',
              onTap: controller.selectPaymentMethod,
            ),
            SizedBox(height: 12.h),

            Obx(
                  () => _buildCard(
                child: InkWell(
                  onTap: controller.selectPaymentMethod,
                  borderRadius: BorderRadius.circular(
                    AppSizes.radiusMD,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payment_rounded,
                        color: AppColors.primary,
                        size: 25.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.selectedPaymentMethod.value,
                              style: AppTextStyles.semiBoldSmall.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Selected payment method',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15.sp,
                        color: AppColors.textLight,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 25.h),

            // CHANGED: Price details section.
            _buildSectionHeader(
              title: 'Price Details',
            ),
            SizedBox(height: 12.h),

            _buildCard(
              child: Column(
                children: [
                  _buildPriceRow('Subtotal', 'Rs. 0'),
                  SizedBox(height: 12.h),
                  _buildPriceRow('Delivery', 'Rs. 0'),
                  Divider(
                    height: 24.h,
                    color: AppColors.lightGrey,
                  ),
                  _buildPriceRow(
                    'Total Amount',
                    'Rs. 0',
                    isTotal: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // CHANGED: Place order button.
            CustomButton(
              text: 'Place Order',
              onTap: controller.placeOrder,
              width: double.infinity,
              height: 52.h,
              borderRadius: AppSizes.radiusLG,
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // CHANGED: Reusable section heading.
  Widget _buildSectionHeader({
    required String title,
    String? action,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.semiBoldLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        if (action != null)
          GestureDetector(
            onTap: onTap,
            child: Text(
              action,
              style: AppTextStyles.medium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
      ],
    );
  }

  // CHANGED: Reusable card container.
  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: child,
    );
  }

  // CHANGED: Reusable price row.
  Widget _buildPriceRow(
      String title,
      String value, {
        bool isTotal = false,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isTotal
              ? AppTextStyles.semiBoldSmall.copyWith(
            color: AppColors.textPrimary,
          )
              : AppTextStyles.bodySmall.copyWith(
            color: AppColors.textLight,
          ),
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.semiBoldLarge.copyWith(
            color: AppColors.primary,
          )
              : AppTextStyles.medium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
