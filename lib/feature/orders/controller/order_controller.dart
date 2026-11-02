import 'package:flutter/material.dart'; // REQUIRED: For returning Widgets
import 'package:get/get.dart';
import 'package:shopping_app/feature/orders/widgets/placed_order_view.dart';
import '../../../core/utils/routes/app_routes.dart';
import '../widgets/delivered_order_view.dart';

import '../widgets/pending_order_view.dart';


class OrderController extends GetxController {

  var selectedStatusTab = AppRoutes.processingOrders.obs;

  final List<String> tabs = [
    AppRoutes.processingOrders,
    AppRoutes.shippedOrders,
    AppRoutes.deliveredOrders,
  ];

  final List<String> tabsName = [
    'Placed Orders',
    'Pending Orders',
    'Delivered Orders',
  ];


  Widget get activeOrderView {
    switch (selectedStatusTab.value) {
      case AppRoutes.processingOrders:
        return const PlacedOrderView() ;
      case AppRoutes.shippedOrders:
        return const PendingOrderView();
      case AppRoutes.deliveredOrders:
        return const DeliveredOrderView() ;
      default:
        return const Center(child: Text('View not found'));
    }
  }

  String getTabLabel(String routePath) {
    int index = tabs.indexOf(routePath);
    if (index != -1 && index < tabsName.length) {
      return tabsName[index];
    }
    return routePath;
  }

}
