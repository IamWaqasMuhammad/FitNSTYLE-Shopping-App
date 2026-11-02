
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  // CHANGED: FAQ data for the Help & Support screen.
  static const List<Map<String, String>> faqs = [
    {
      'question': 'How can I place an order?',
      'answer':
      'Browse products, select your preferred item, add it to your cart, and proceed to checkout.',
    },
    {
      'question': 'How can I track my order?',
      'answer':
      'You can check your order status from the Orders section in your profile.',
    },
    {
      'question': 'Can I cancel my order?',
      'answer':
      'Order cancellation depends on the current order status and store policy.',
    },
    {
      'question': 'What payment methods are available?',
      'answer':
      'Available payment methods will be displayed during checkout.',
    },
    {
      'question': 'How can I return a product?',
      'answer':
      'Please contact our support team for assistance with product returns.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Help & Support',
          style: AppTextStyles.headingLarge,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CHANGED: Help introduction section.
              Text(
                'How can we help you?',
                style: AppTextStyles.headingLarge,
              ),
              8.verticalSpace,
              Text(
                'Find answers to common questions or contact our support team.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textLight,
                ),
              ),

              24.verticalSpace,

              // CHANGED: Search help field.
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for help...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.lightGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              28.verticalSpace,

              Text(
                'Frequently Asked Questions',
                style: AppTextStyles.headingLarge,
              ),

              16.verticalSpace,

              // CHANGED: Expandable FAQ list.
              ...faqs.map(
                    (faq) => Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      childrenPadding: EdgeInsets.fromLTRB(
                        16.w,
                        0,
                        16.w,
                        16.h,
                      ),
                      title: Text(
                        faq['question']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            faq['answer']!,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.textLight,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              24.verticalSpace,

              Text(
                'Still need help?',
                style: AppTextStyles.headingLarge,
              ),

              8.verticalSpace,

              Text(
                'Our support team is here to help you.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textLight,
                ),
              ),

              16.verticalSpace,

              // CHANGED: Contact support options.
              _SupportTile(
                icon: Icons.email_outlined,
                title: 'Email Support',
                subtitle: 'Send us your queries',
                onTap: () {
                  Get.snackbar(
                    'Email Support',
                    'Connect your support email action here.',
                  );
                },
              ),

              _SupportTile(
                icon: Icons.phone_outlined,
                title: 'Call Support',
                subtitle: 'Talk to our support team',
                onTap: () {
                  Get.snackbar(
                    'Call Support',
                    'Connect your support phone number here.',
                  );
                },
              ),

              _SupportTile(
                icon: Icons.chat_bubble_outline,
                title: 'Live Chat',
                subtitle: 'Chat with our support team',
                onTap: () {
                  Get.snackbar(
                    'Live Chat',
                    'Live chat will be available soon.',
                  );
                },
              ),

              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

// CHANGED: Reusable support option widget.
class _SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 6.h,
        ),
        leading: Icon(
          icon,
          color: AppColors.textLight,
          size: 24.sp,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textLight,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
