import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Statusrequest.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/forgetPassword/verifyCode_forgetPassword.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController{

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());
  String? email;
  StatusRequest statusRequest =StatusRequest.none;

  @override
  void onInit() {
    email = Get.arguments['email'] ;
    super.onInit();
  }


  @override
  checkCode() {}

  @override
  goToResetPassword( verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postData( email!, verifyCode);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoutes.resetPassword,arguments: {
          "email" : email
        });
      }else{
        Get.defaultDialog(title: "Warning" , middleText: "VerifyCode Not Correct") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}