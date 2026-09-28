import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class CustomGridCard extends StatelessWidget {
  final double height;
  final double width;
  final Color? bgColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final String image;
  final String title;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  const CustomGridCard({
    super.key,
    this.height = 240, // standard grid card height optimized via ScreenUtil
    this.width = 160,  // standard grid card width
    this.bgColor = AppColors.lightGrey, // fallbacks configurations
    this.borderRadius,
    this.boxShadow,
    required this.image,
    required this.title,
    required this.price,
    this.isFavorite = false,
    required this.onFavoriteTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? BorderRadius.circular(12.r);

    return InkWell(
      onTap: onTap,
      borderRadius: effectiveRadius as BorderRadius,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: effectiveRadius,
          boxShadow: boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================== TOP PART: IMAGE & FAV BUTTON ====================
            Expanded(
              flex: 6, // Allocates 60% of card space to layout assets dynamically
              child: Stack(
                children: [
                  // Product Image Asset Rendering
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.textLight,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),

                  // Favorite Action Layout Configuration (Top Right Corner)
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: onFavoriteTap,
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : AppColors.textLight,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ==================== BOTTOM PART: TITLE & PRICE DATA ====================
            Expanded(
              flex: 4, // Allocates remaining 40% area to information metrics
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      price,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
