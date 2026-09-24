import 'package:get/get.dart';
import 'package:shopping_app/feature/auth/view/login_view.dart';
import 'package:shopping_app/feature/auth/view/register_view.dart';
import 'package:shopping_app/feature/dashboard/view/dashboard_view.dart';
import 'package:shopping_app/feature/home/binding/home_binding.dart';
import 'package:shopping_app/feature/home/view/home_view.dart';
import 'package:shopping_app/feature/notifications/binding/notifications_binding.dart';
import 'package:shopping_app/feature/notifications/view/notifications_view.dart';
import 'package:shopping_app/feature/orders/binding/order_binding.dart';
import 'package:shopping_app/feature/orders/view/order_view.dart';
import 'package:shopping_app/feature/profile/binding/profile_binding.dart';
import 'package:shopping_app/feature/profile/view/profile_view.dart';
import 'package:shopping_app/feature/splash/binding/splash_binding.dart';
import 'package:shopping_app/feature/splash/view/splash_view.dart';

import '../../../feature/auth/binding/auth_binding.dart';
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
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: AuthBinding(),
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
  ];
}