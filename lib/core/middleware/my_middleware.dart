import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("step")== "2"){
      return const RouteSettings(name: AppRoutes.homePage);
    }

    if(myServices.sharedPreferences.getString("step")== "1"){
      return const RouteSettings(name: AppRoutes.login);
    }

    return null;
  }
}