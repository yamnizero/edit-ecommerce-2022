 import 'package:ecommerc_2022/controller/home_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/Statusrequest.dart';
import '../core/function/handlingData_controller.dart';
import '../data/datasource/remote/items_data.dart';

abstract class ItemsController extends GetxController{

  intialData();
  changeCat(int val,String catVal);
  getItems(String categoryId );
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp  extends SearchMixController{

  List categories = [];
  String? catId ;
  int? selectedCategories ;
  ItemsData itemsData =ItemsData(Get.find());
  String deliveryTime = "" ;

  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();


  @override
  void onInit() {
    search = TextEditingController();
    intialData();
  }

  @override
  intialData() {
    deliveryTime = myServices.sharedPreferences.getString("deliveryTime")!;
    categories = Get.arguments['categories'];
    selectedCategories = Get.arguments['selectedCategories'];
    catId = Get.arguments['catId'];
    getItems(catId!);
  }



  @override
  changeCat(val ,catVal) {
   selectedCategories = val;
   catId= catVal;
   getItems(catId!);
   update();
  }

  @override
  getItems(categoryId) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId, myServices.sharedPreferences.getString("id")!);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  goToPageProductDetails( itemsModel){
    Get.toNamed("productDetails",arguments: {
      "itemsModel" : itemsModel
    });
  }
}