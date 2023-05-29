import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/address_data.dart';
import 'package:ecommerc_2022/data/datasource/remote/check_out_data.dart';
import 'package:ecommerc_2022/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";
  List<AddressModel> dataAddress = [];


  late String couponId;
  late String priceOrders;
  late String couponDiscount;




  choosesPaymentMethod(String val){
    paymentMethod =val;
    update();
  }

  choosesDeliveryType(String val) {
    deliveryType =val;
    update();
  }

  choosesShippingAddress(String val){
    addressId =val;
    update();
  }

  getShippingAddress()async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!
    );
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listData = response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkOut()async{
    if(paymentMethod == null)return  Get.snackbar("Error", "Please select a payment method");
    if(deliveryType == null)return  Get.snackbar("Error", "Please select order type");
    update();
    statusRequest = StatusRequest.loading;
    Map data ={
    "usersid" :  myServices.sharedPreferences.getString("id"),
    "addressid" : addressId.toString() ,
    "orderstype" :  deliveryType.toString(),
    "pricedelivery" : "10",
    "ordersprice" : priceOrders,
    "couponid" : couponId,
    "couponDiscount" : couponDiscount.toString(),
    "paymentmethod" : paymentMethod.toString(),
    };
    var response = await checkOutData.checkOut(data);

    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("Success", "The order was successfully");
      }else{
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }
  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    priceOrders = Get.arguments['priceOrder'];
    couponDiscount = Get.arguments['discountCoupon'].toString();
    getShippingAddress();
    super.onInit();
  }


}
