import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Statusrequest.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/forgetPassword/resetPassword.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  ResetPasswordData resetPasswordData =ResetPasswordData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  void onInit() {
    email =Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if(password.text != rePassword.text) {
      return Get.defaultDialog(title: "Warning" , middleText: "Password Not Match");
    }
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData( email!, password.text);
      print("========================== $response controller");
      statusRequest  = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success"){
          Get.offNamed(AppRoutes.successResetPassword);
        }else{
          Get.defaultDialog(title: "Warning" , middleText: "Try Again") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

}