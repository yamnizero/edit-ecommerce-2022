import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/cart_data.dart';
import 'package:ecommerc_2022/data/model/cart_model.dart';
import 'package:ecommerc_2022/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<CartModel> data =[];
  double priceOrder =0.0;
  int totalCountItems = 0;

  TextEditingController? controllerCoupon;
  CouponModel? couponModel;
  int? discountCoupon =0  ;
  String? couponName ;
  String? couponId ;


  add(String itemsid) async {

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


  delete(String itemsid) async {

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


  resetVarCart(){
    totalCountItems = 0;
    priceOrder = 0.0;
    data.clear();
  }

  refreshPage(){
    resetVarCart();
    view();
  }

  view() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        if(response['datacart']['status'] == 'success'){
          List dataResponse = response['datacart']['data'] ;
          Map dataResponseCountPrice = response['countprice'] ;
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
          totalCountItems = int.parse(dataResponseCountPrice['totalcount']);
          priceOrder = double.parse(dataResponseCountPrice['totalprice']);
        }
        // data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCouponApply() async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(
     controllerCoupon!.text
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Map<String , dynamic> dataCoupon =  response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon =int.parse(couponModel!.couponDiscount!);
        couponName  = couponModel!.couponName;
        couponId = couponModel!.couponId;
        // data.addAll(response['data']);
      }else{
        //statusRequest = StatusRequest.failure;
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Warning", "Coupon Not Valid");
      }
    }
    update();
  }

  getTotalPriceAfterCoupon(){
    return (priceOrder - priceOrder * discountCoupon! / 100 );
  }

  goToPageCheckOut(){
    if(data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoutes.checkOut,arguments: {
      "couponId" : couponId ?? "0",
      "priceOrder" :  priceOrder.toString(),
      "discountCoupon" : discountCoupon.toString(),
    });

  }


  @override
  void onInit() {
    controllerCoupon =TextEditingController();
    view();

    super.onInit();
  }

}