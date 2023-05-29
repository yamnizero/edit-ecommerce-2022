import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{

  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{

  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

}