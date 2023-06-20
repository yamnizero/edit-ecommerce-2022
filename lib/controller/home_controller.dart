import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/data/datasource/remote/home_data.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

abstract class HomeController extends SearchMixController{
  initialData();
  getData();
  goToItems(List categories,  int selectedCategories ,String categoryId);

}

class  HomeControllerImp extends HomeController{

  MyServices myServices = Get.find();
  //HomeData homeData =HomeData(Get.find());


  String? username ;
  String? id ;
  String? lang ;

  List categories = [];
  List items = [];
  List announcementData = [];


  //search

  goToPageProductDetails(itemsModel){
    Get.toNamed("productDetails",arguments: {
      "itemsModel" : itemsModel
    });
  }

  //search



  @override
  initialData(){
    lang =myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }
  @override
  void onInit() {
    search = TextEditingController();

    getData();
    initialData();

    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        announcementData.addAll(response['announcement']['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }





  @override
  goToItems(categories,  selectedCategories,categoryId) {
   Get.toNamed(AppRoutes.itemsPage,arguments: {
     "categories" : categories,
     "selectedCategories" : selectedCategories,
     "catId":categoryId,
   });
  }

}

class SearchMixController extends GetxController{
  HomeData homeData =HomeData(Get.find());
  late StatusRequest statusRequest;
  List<ItemsModel> listData = [];
  bool isSearch =false;
  TextEditingController? search;


  checkSearch(val){
    if(val == ""){
      statusRequest =StatusRequest.none;
      isSearch =false;
    }
    update();
  }

  onSearchItems(){
    isSearch =true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}