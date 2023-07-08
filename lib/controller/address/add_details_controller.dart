import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AddAddressDetailsController extends GetxController {

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData =AddressData(Get.find());

  TextEditingController?  name ;
  TextEditingController?  city;
  TextEditingController?  street;

  String? lat;
  String? long;
  initialData(){
    name   = TextEditingController();
    city   = TextEditingController();
    street = TextEditingController();

    lat    = Get.arguments['lat'];
    long   = Get.arguments['long'];
    print(lat);
    print(long);
  }

    addAddress()async{
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addData(
          myServices.sharedPreferences.getString("id")!,
          name!.text,
          city!.text,
          street!.text,
          lat!,
          long!,
      );
      print("========================== $response controller");
      statusRequest  = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success"){

          Get.offAllNamed(AppRoutes.homePage);
          Get.snackbar("Error", "Now , You Can Order to this Address ");
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }




  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
