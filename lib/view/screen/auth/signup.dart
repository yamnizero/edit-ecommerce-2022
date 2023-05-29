import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/Statusrequest.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/alertexitapp.dart';
import '../../../core/function/validator_input.dart';
import '../../widget/auth/custom_buttom_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/text_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '17'.tr,
          style: Theme.of(context).textTheme.headline1!.copyWith(
            color: AppColor.grey,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) =>
    HandlingDataRequest(
    statusRequest: controller.statusRequest ,
    widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextTitleAuth(
                      text: "10".tr
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBodyAuth(
                    text:
                    "24".tr,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                    valid: (val){
                      return validInput(val!, 3, 20, "username");
                    },
                    myController: controller.username,
                    hintText: "23".tr,
                    iconData: Icons.person_outlined,
                    label: "20".tr,
                    isNumber: false,

                  ),
                  CustomTextFormAuth(
                    valid: (val){
                      return validInput(val!, 3, 40, "email");
                    },
                    isNumber: false,
                    myController: controller.email,
                    hintText: "12".tr,
                    iconData: Icons.email_outlined,
                    label:"18".tr,

                  ),
                  CustomTextFormAuth(
                    valid: (val){
                      return validInput(val!, 7, 11, "phone");
                    },
                    isNumber: true,
                    myController: controller.phone,
                    hintText: "22".tr,
                    iconData: Icons.phone_android_outlined,
                    label:"21".tr,
                  ),
                  CustomTextFormAuth(
                    valid: (val){
                      return validInput(val!, 3, 30, "password");
                    },
                    isNumber: false,
                    myController: controller.password,
                    hintText: "13".tr,
                    iconData: Icons.lock_outline,
                    label: "19".tr,
                  ),
                  CustomButtonAuth(
                    text: "17".tr,
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextSignUpOrSignIn(
                    textOne:"25".tr,
                    textTwo:"26".tr,
                    onTap: (){
                      controller.goToSignIn();
                    },
                  )
                ],
              ),
            ),
          )
    ),
        ),
      ),
    );
  }
}
