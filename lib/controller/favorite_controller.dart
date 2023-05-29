import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends  GetxController{

  FavoriteData favoriteData =FavoriteData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  ///create map
  ///key => id items
  ///value => 1 or 0
  Map isFavorite = {};

  setFavorite(id , value){
    isFavorite[id] = value;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
         myServices.sharedPreferences.getString("id")!,itemsid,
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
         Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج من المفضله"),
        );
       // data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
         myServices.sharedPreferences.getString("id")!,itemsid
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم الحدف المنتج من المفضله"),
        );
        //data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }
}