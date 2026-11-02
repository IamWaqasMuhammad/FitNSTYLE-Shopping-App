import 'package:flutter/material.dart';
import '../../../core/common_widgets/custom_order_card.dart';

class DeliveredOrderView extends StatelessWidget {
  const DeliveredOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      children: [
        const Text(
          'Your successfully delivered orders',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 16),

        OrderCard(
          orderId: '#FS10230',
          productName: 'Men Casual Shirt',
          productDescription: 'Size: M  |  Color: Grey',
          orderDate: '20 Oct 2026',
          price: 'Rs. 3,000',
          status: 'Delivered',
          statusColor: Colors.green,
          productIcon: Icons.checkroom_outlined,
          buttonText: 'Reorder',
          onButtonTap: () {},
        ),

        OrderCard(
          orderId: '#FS10231',
          productName: 'Classic Sneakers',
          productDescription: 'Size: 42  |  Color: White',
          orderDate: '18 Oct 2026',
          price: 'Rs. 6,000',
          status: 'Delivered',
          statusColor: Colors.green,
          productIcon: Icons.shopping_bag_outlined,
          buttonText: 'Reorder',
          onButtonTap: () {},
        ),
      ],
    );
  }
}