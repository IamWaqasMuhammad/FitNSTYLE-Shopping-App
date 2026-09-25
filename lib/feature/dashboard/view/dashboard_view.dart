import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopping_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:shopping_app/feature/dashboard/widgets/bottom_navbar.dart';
import 'package:shopping_app/feature/home/view/home_view.dart';
import 'package:shopping_app/feature/notifications/view/notifications_view.dart';
import 'package:shopping_app/feature/orders/view/order_view.dart';
import 'package:shopping_app/feature/profile/view/profile_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final List<Widget> pages = [
    HomeView(),
    NotificationsView(),
    OrderView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      body: Obx(
            () => SafeArea(
              child: IndexedStack(
                        index: controller.currentIndex.value,
                        children: pages,
                      ),
            ),
      ),
      bottomNavigationBar: Obx(
            () => CustomNavBar(
          currentIndex: controller.currentIndex.value,
          onItemTap: controller.changePage,
        ),
      ),
    );
  }
}