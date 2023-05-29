import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/data/datasource/remote/forgetPassword/checkEmail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Statusrequest.dart';
import '../../core/function/handlingData_controller.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest =StatusRequest.none;


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  checkEmail() async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text );
      print("========================== $response controller");
      statusRequest  = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success"){
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.verifyCode,arguments: {
            "email" : email.text,
          });
        }else{
          Get.defaultDialog(title: "Warning" , middleText: "Email Not Found") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }


}