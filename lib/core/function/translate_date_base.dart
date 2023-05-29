import 'package:ecommerc_2022/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(ar ,en){
  MyServices myServices = Get.find();
  if(myServices.sharedPreferences.getString("lang") == "ar"){
    return ar;
  }else{
    return en;
  }
}