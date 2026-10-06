import 'package:flutter/material.dart'; // REQUIRED: For returning Widgets
import 'package:get/get.dart';
import '../../../core/utils/routes/app_routes.dart';
import '../view/cancelled_orders_view.dart';
import '../view/delivered_orders_view.dart';
import '../view/processing_orders_view.dart';
import '../view/returned_orders_view.dart';
import '../view/shippped_orders_view.dart';


class OrderController extends GetxController {

  var selectedStatusTab = AppRoutes.processingOrders.obs;

  final List<String> tabs = [
    AppRoutes.processingOrders,
    AppRoutes.shippedOrders,
    AppRoutes.deliveredOrders,
    AppRoutes.returnedOrders,
    AppRoutes.cancelledOrders
  ];

  final List<String> tabsName = [
    'Processing Orders',
    'Shipped Orders',
    'Delivered Orders',
    'Returned Orders',
    'Cancelled Orders'
  ];


  Widget get activeOrderView {
    switch (selectedStatusTab.value) {
      case AppRoutes.processingOrders:
        return const ProcessingOrdersView();
      case AppRoutes.shippedOrders:
        return const ShippedOrdersView();
      case AppRoutes.deliveredOrders:
        return const DeliveredOrdersView();
      case AppRoutes.returnedOrders:
        return const ReturnedOrdersView();
      case AppRoutes.cancelledOrders:
        return const CancelledOrdersView();
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
