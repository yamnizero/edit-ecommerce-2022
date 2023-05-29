import 'package:ecommerc_2022/core/constant/name_routes.dart';

import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController{


  @override
  goToPageLogin() {
    Get.offNamed(AppRoutes.login);
  }

}