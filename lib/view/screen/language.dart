import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/language/custom_button_language.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("1".tr,style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20,),
            CustomButtonLanguage(
              textButton: "Ar",
              onPressed: (){
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            CustomButtonLanguage(
              textButton: "En",
              onPressed: (){
                controller.changeLang("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),

          ],
        ),
      ),
    );
  }
}
