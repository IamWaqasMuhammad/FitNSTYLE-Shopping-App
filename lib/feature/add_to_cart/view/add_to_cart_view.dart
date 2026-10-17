import 'package:flutter/material.dart';
import 'package:shopping_app/core/constants/app_colors.dart';
import 'package:shopping_app/core/constants/app_sizes.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: AppColors.primary,
                  child: Text('Cart'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
