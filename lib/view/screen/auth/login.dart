import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:ecommerc_2022/core/function/validator_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/alertexitapp.dart';
import '../../widget/auth/custom_buttom_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/text_signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign In",
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest ,
            widget:  Container(
              padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    CustomTextTitleAuth(
                      text: "10".tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBodyAuth(
                      text: "11".tr,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      isNumber: false,
                      myController: controller.email,
                      hintText: "12".tr,
                      iconData: Icons.email_outlined,
                      label: "18".tr,
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormAuth(
                        obscureText: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        isNumber: false,
                        myController: controller.password,
                        hintText: "13".tr,
                        iconData: Icons.lock_outline,
                        label: "19".tr,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "14".tr,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtonAuth(
                      text: "15".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextSignUpOrSignIn(
                        textOne: "16".tr,
                        textTwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
