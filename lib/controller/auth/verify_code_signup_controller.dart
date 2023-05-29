import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:get/get.dart';
import '../../core/class/Statusrequest.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/auth/verfiycodesginup.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{

  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  StatusRequest statusRequest =StatusRequest.none;

  String? email;


  @override
  void onInit() {
    email = Get.arguments['email'] ;
    super.onInit();
  }


  @override
  checkCode() {}

  @override
  goToSuccessSignUp( verifyCodeSignUp )  async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData( email!, verifyCodeSignUp);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoutes.successSignUp);
      }else{
        Get.defaultDialog(title: "Warning" , middleText: "VerifyCode Not Correct") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  reSend(){
    verifyCodeSignUpData.resendVerifyCode( email!);
  }

}