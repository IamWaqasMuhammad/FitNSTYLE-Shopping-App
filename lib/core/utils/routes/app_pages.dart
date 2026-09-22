import 'package:get/get.dart';
import 'package:shopping_app/feature/auth/view/login_view.dart';
import 'package:shopping_app/feature/auth/view/register_view.dart';
import 'package:shopping_app/feature/splash/binding/splash_binding.dart';
import 'package:shopping_app/feature/splash/view/splash_view.dart';

import '../../../feature/auth/binding/auth_binding.dart';
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
  ];
}