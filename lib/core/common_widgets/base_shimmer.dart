import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/core/constants/app_colors.dart'; // Update path

class BaseShimmer extends StatelessWidget {
  final Widget child;

  const BaseShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightGrey,
      highlightColor: AppColors.surfaceSecondary,
      period: const Duration(milliseconds: 1500),
      child: child,
    );
  }
}
