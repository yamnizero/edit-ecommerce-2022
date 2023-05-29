
import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/address_data.dart';
import 'package:ecommerc_2022/data/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController{

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  getData()async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(myServices.sharedPreferences.getString("id")!);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      //start backend
      if(response['status'] == "success"){
       List listData = response['data'];
       data.addAll(listData.map((e) => AddressModel.fromJson(e)));
       if(data.isEmpty){
         statusRequest = StatusRequest.failure;
       }

      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressid){
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId ==  addressid);
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}