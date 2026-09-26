import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavbarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 42.h,
            width: 52.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.white.withValues(alpha: 0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Icon(
                icon,
                size: isSelected? 30.h :24.h,
                color: isSelected
                    ? AppColors.white
                    : AppColors.white.withValues(alpha: 0.55),
              ),
            ),
          ),
        ),
      ),
    );
  }
}