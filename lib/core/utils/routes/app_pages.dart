import 'package:get/get.dart';
import 'package:shopping_app/feature/auth/binding/login_binding.dart';
import 'package:shopping_app/feature/auth/binding/register_binding.dart';
import 'package:shopping_app/feature/auth/view/login_view.dart';
import 'package:shopping_app/feature/auth/view/register_view.dart';
import 'package:shopping_app/feature/home/view/category_view.dart';
import 'package:shopping_app/feature/dashboard/view/dashboard_view.dart';
import 'package:shopping_app/feature/home/binding/home_binding.dart';
import 'package:shopping_app/feature/home/view/home_view.dart';
import 'package:shopping_app/feature/notifications/binding/notifications_binding.dart';
import 'package:shopping_app/feature/notifications/view/notifications_view.dart';
import 'package:shopping_app/feature/orders/binding/order_binding.dart';
import 'package:shopping_app/feature/orders/view/cancelled_orders_view.dart';
import 'package:shopping_app/feature/orders/view/delivered_orders_view.dart';
import 'package:shopping_app/feature/orders/view/orders_view.dart';
import 'package:shopping_app/feature/orders/view/processing_orders_view.dart';
import 'package:shopping_app/feature/orders/view/returned_orders_view.dart';
import 'package:shopping_app/feature/orders/view/shippped_orders_view.dart';
import 'package:shopping_app/feature/product/view/product_detail_view.dart';
import 'package:shopping_app/feature/profile/binding/profile_binding.dart';
import 'package:shopping_app/feature/profile/view/profile_view.dart';
import 'package:shopping_app/feature/splash/binding/splash_binding.dart';
import 'package:shopping_app/feature/splash/view/splash_view.dart';
import '../../../feature/dashboard/binding/dashboard_binding.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () =>  DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const OrderView(),
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.category,
      page: () => const CategoryView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.processingOrders,
      page: () => const ProcessingOrdersView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.shippedOrders,
      page: () => const ShippedOrdersView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.deliveredOrders,
      page: () => const DeliveredOrdersView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.returnedOrders,
      page: () => const ReturnedOrdersView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.cancelledOrders,
      page: () => const CancelledOrdersView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailView(),
      transition: Transition.fadeIn,
    ),
  ];
}