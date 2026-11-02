import 'package:flutter/material.dart';
import '../../../core/common_widgets/custom_order_card.dart';

class PlacedOrderView extends StatelessWidget {
  const PlacedOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      children: [
        const Text(
          'Your recently placed orders',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 16),

        OrderCard(
          orderId: '#FS10245',
          productName: 'Classic White T-Shirt',
          productDescription: 'Size: M  |  Color: White',
          orderDate: '01 Nov 2026',
          price: 'Rs. 2,500',
          status: 'Order Placed',
          statusColor: Colors.blue,
          productIcon: Icons.checkroom_outlined,
          buttonText: 'View Details',
          onButtonTap: () {},
        ),

        OrderCard(
          orderId: '#FS10246',
          productName: 'Casual Denim Jacket',
          productDescription: 'Size: L  |  Color: Blue',
          orderDate: '30 Oct 2026',
          price: 'Rs. 5,500',
          status: 'Order Placed',
          statusColor: Colors.blue,
          productIcon: Icons.checkroom_outlined,
          buttonText: 'View Details',
          onButtonTap: () {},
        ),
      ],
    );
  }
}