import 'package:flutter/material.dart';
import '../../../core/common_widgets/custom_order_card.dart';

class PendingOrderView extends StatelessWidget {
  const PendingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      children: [
        const Text(
          'Your orders are being processed',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 16),

        OrderCard(
          orderId: '#FS10240',
          productName: 'Premium Black Hoodie',
          productDescription: 'Size: L  |  Color: Black',
          orderDate: '28 Oct 2026',
          price: 'Rs. 4,500',
          status: 'In Progress',
          statusColor: Colors.orange,
          productIcon: Icons.checkroom_outlined,
          buttonText: 'Track Order',
          onButtonTap: () {},
        ),

        OrderCard(
          orderId: '#FS10241',
          productName: 'Slim Fit Jeans',
          productDescription: 'Size: 32  |  Color: Blue',
          orderDate: '27 Oct 2026',
          price: 'Rs. 3,800',
          status: 'Shipping',
          statusColor: Colors.orange,
          productIcon: Icons.checkroom_outlined,
          buttonText: 'Track Order',
          onButtonTap: () {},
        ),
      ],
    );
  }
}