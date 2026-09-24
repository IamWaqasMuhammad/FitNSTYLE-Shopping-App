import 'package:get/get.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';
import 'package:shopping_app/feature/auth/widgets/forget_password_bottom_sheet.dart';

class AuthController extends GetxController{






  void gotoRegisterScreen(){
    Get.toNamed(AppRoutes.register);
  }
  void gotoLoginScreen(){
    Get.toNamed(AppRoutes.login);
  }

  void showForgetBottomSheet(){
    ForgotPasswordSheet.show();
  }
}