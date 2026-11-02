
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common_widgets/custom_snack_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Payment Methods',
          style: AppTextStyles.headingSmall,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CHANGED: Added introductory heading.
              Text(
                'Manage your cards',
                style: AppTextStyles.headingLarge,
              ),
              SizedBox(height: 6.h),
              Text(
                'Add and manage your preferred payment methods.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textLight,
                ),
              ),

              SizedBox(height: 25.h),

              // CHANGED: Section heading with add action.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saved Cards',
                    style: AppTextStyles.headingSmall,
                  ),
                  TextButton.icon(
                    onPressed: _addNewCard,
                    icon: Icon(
                      Icons.add,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                    label: Text(
                      'Add New',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // CHANGED: Sample saved payment cards.
              _buildPaymentCard(
                cardType: 'VISA',
                cardNumber: '**** **** **** 4582',
                cardHolder: 'Waqas Muhammad',
                expiryDate: '12/28',
                isDefault: true,
                cardColor: const Color(0xFF172B4D),
              ),

              SizedBox(height: 15.h),

              _buildPaymentCard(
                cardType: 'Mastercard',
                cardNumber: '**** **** **** 8291',
                cardHolder: 'Waqas Muhammad',
                expiryDate: '08/27',
                isDefault: false,
                cardColor: const Color(0xFF343434),
              ),

              SizedBox(height: 28.h),

              // CHANGED: Security information section.
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: AppColors.primary,
                      size: 25.sp,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your payment is secure',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Your payment information is protected. '
                                'Never share your card details or security code.',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textLight,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              // CHANGED: Add payment method button.
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton.icon(
                  onPressed: _addNewCard,
                  icon: const Icon(Icons.add),
                  label: Text(
                    'Add Payment Method',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // CHANGED: Reusable payment card widget.
  Widget _buildPaymentCard({
    required String cardType,
    required String cardNumber,
    required String cardHolder,
    required String expiryDate,
    required bool isDefault,
    required Color cardColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardType,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isDefault)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'DEFAULT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 25.h),

          Text(
            cardNumber,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 22.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _cardDetail('CARD HOLDER', cardHolder),
              _cardDetail('EXPIRES', expiryDate),
            ],
          ),

          SizedBox(height: 15.h),

          Divider(
            color: Colors.white.withValues(alpha: 0.2),
            height: 1,
          ),

          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _showMessage('Edit card'),
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () => _showMessage('Remove card'),
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // CHANGED: Reusable card detail widget.
  Widget _cardDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // CHANGED: Temporary UI action placeholders.
  void _addNewCard() {
    CustomSnackBar.showInfo(
      title: 'Payment Methods',
      message:
      'Add card functionality will be connected later....',
    );
  }

  void _showMessage(String action) {
    CustomSnackBar.showInfo(
      title: 'Payment Methods',
      message:
      '$action functionality will be connected later....',
    );
  }
}
