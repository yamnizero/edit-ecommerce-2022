import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  MyServices myServices = Get.find();


  logOut(){
    String userid =myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }


}