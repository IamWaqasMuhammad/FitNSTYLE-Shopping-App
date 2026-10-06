import 'package:flutter/cupertino.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';

class ShippedOrdersView extends StatelessWidget {
  const ShippedOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text('Shipped Orders Screen',style: AppTextStyles.headingLarge,),
        )
      ],
    );
  }
}
