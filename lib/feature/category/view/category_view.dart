import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/custom_button.dart';
import 'package:shopping_app/core/common_widgets/custom_list_view.dart';
import 'package:shopping_app/core/common_widgets/custom_search_bar.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';
import 'package:shopping_app/core/utils/extensions/sized_box_extension.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';
import 'package:shopping_app/feature/home/controller/home_controller.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../home/widgets/category_list_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.md),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomButton(
                      onTap: () {
                        Get.offNamed(AppRoutes.dashboard);
                      },
                      height: 40.w,
                      width: 40.w,
                      icon: const Icon(CupertinoIcons.back),
                      backgroundColor: AppColors.lightGrey,
                      isSecondary: true,
                      borderRadius: AppSizes.radiusCircular,
                    ),
                    10.width,
                    Expanded(
                      child: CustomSearchBar(
                        hintText: 'What you looking for today?',
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                  ],
                ),
                25.height,
                Text(
                  'Shop by Categories',
                  style: AppTextStyles.headingLarge,
                ),
                20.height,

                CustomListView(
                  scrollDirection: Axis.vertical,
                  separatorHeight: 12.h,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];

                    return CategoryListItem(
                      title: category['name']!,
                      image: category['image']!,
                      onTap: () {
                        debugPrint(
                          'Selected category: ${category['name']}',
                        );
                      },
                    );
                  },
                ),
              ],
            )

          ),
        ),
      ),
    );
  }
}
