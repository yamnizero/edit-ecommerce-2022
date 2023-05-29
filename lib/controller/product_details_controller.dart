import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/cart_data.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{

}

class ProductDetailsControllerImp extends ProductDetailsController{
  CartData cartData = CartData(Get.find());
  //CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  int countItems  =0;

  intialData()async{
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countItems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  addItems(String itemsid) async {

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,itemsid,
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الي السلة "),
        );
        // data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  deleteItems(String itemsid) async {

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
      myServices.sharedPreferences.getString("id")!,itemsid,
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم ازالة المنتج من السلة "),
        );
        // data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsid) async{
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
      myServices.sharedPreferences.getString("id")!,itemsid,
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        int countItems = 0;
        countItems = int.parse(response['data']);
        print("===============================");
        print("$countItems");
        return countItems;
        // data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  List subItems = [
    {
      "name" : "Red",
      "id" : 1,
      "active" : "1",
    },
    {
      "name" : "Black",
      "id" : 2,
      "active" : "0",
    },
    {
      "name" : "Blue",
      "id" : 3,
      "active" : "0",
    },
  ];


  add(){
    addItems(itemsModel.itemsId!);
    countItems++;
    update();
  }
  remove(){
    if(countItems > 0){
    deleteItems(itemsModel.itemsId!);
      countItems--;
      update();
    }

  }


  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}