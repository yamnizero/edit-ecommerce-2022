import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/Statusrequest.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToSignIn();
}

class   SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

   StatusRequest statusRequest =StatusRequest.none;
  SignUpData signUpData =SignUpData(Get.find());

  List data = [];

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  signUp() async {
    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(username.text, password.text, email.text, phone.text);
      print("========================== $response controller");
      statusRequest  = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success"){
         // data.addAll(response['data']);
           Get.offNamed(AppRoutes.verifyCodeSignUp,arguments: {
             "email" : email.text
           });
        }else{
          Get.defaultDialog(title: "Warning" , middleText: "Phone Number Or Email Already Exists") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }else{
    }

  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

}