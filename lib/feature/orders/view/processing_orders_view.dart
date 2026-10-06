import 'package:flutter/cupertino.dart';
import 'package:shopping_app/core/constants/app_text_styles.dart';

class ProcessingOrdersView extends StatelessWidget {
  const ProcessingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text('Processing Orders Screen',style: AppTextStyles.headingLarge,),
        )
      ],
    );
  }
}
