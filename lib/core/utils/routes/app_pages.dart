import 'package:get/get.dart';
import 'package:shopping_app/feature/about/view/about_view.dart';
import 'package:shopping_app/feature/auth/binding/login_binding.dart';
import 'package:shopping_app/feature/auth/binding/register_binding.dart';
import 'package:shopping_app/feature/auth/view/login_view.dart';
import 'package:shopping_app/feature/auth/view/register_view.dart';
import 'package:shopping_app/feature/cart/binding/shopping_cart_binding.dart';
import 'package:shopping_app/feature/cart/view/shopping_cart_view.dart';
import 'package:shopping_app/feature/category/view/category_view.dart';
import 'package:shopping_app/feature/checkout/binding/checkout_binding.dart';
import 'package:shopping_app/feature/checkout/view/checkout_view.dart';
import 'package:shopping_app/feature/checkout/view/payment_methods_view.dart';
import 'package:shopping_app/feature/dashboard/binding/dashboard_binding.dart';
import 'package:shopping_app/feature/dashboard/view/dashboard_view.dart';
import 'package:shopping_app/feature/favourite/view/wishlist_view.dart';
import 'package:shopping_app/feature/help_and_support/view/help_support_view.dart';
import 'package:shopping_app/feature/home/binding/home_binding.dart';
import 'package:shopping_app/feature/home/view/home_view.dart';
import 'package:shopping_app/feature/notifications/binding/notifications_binding.dart';
import 'package:shopping_app/feature/notifications/view/notifications_view.dart';
import 'package:shopping_app/feature/orders/binding/order_binding.dart';
import 'package:shopping_app/feature/orders/view/orders_view.dart';
import 'package:shopping_app/feature/orders/widgets/delivered_order_view.dart';
import 'package:shopping_app/feature/orders/widgets/pending_order_view.dart';
import 'package:shopping_app/feature/orders/widgets/placed_order_view.dart';
import 'package:shopping_app/feature/product/view/product_detail_view.dart';
import 'package:shopping_app/feature/profile/binding/profile_binding.dart';
import 'package:shopping_app/feature/profile/view/edit_profile_view.dart';
import 'package:shopping_app/feature/profile/view/profile_view.dart';
import 'package:shopping_app/feature/settings/binding/settings_binding.dart';
import 'package:shopping_app/feature/settings/view/settings_view.dart';
import 'package:shopping_app/feature/splash/binding/splash_binding.dart';
import 'package:shopping_app/feature/splash/view/splash_view.dart';
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
      page: () => const PendingOrderView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.shippedOrders,
      page: () => const DeliveredOrderView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.deliveredOrders,
      page: () => const PlacedOrderView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.shoppingCart,
      page: () => const ShoppingCartView(),
      binding: ShoppingCartBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.wishlist,
      page: () => const WishlistView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.helpSupport,
      page: () => const HelpSupportView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.paymentMethod,
      page: () => const PaymentMethodsView(),
      binding: CheckoutBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutView(),
      transition: Transition.fadeIn,
    ),

  ];
}
