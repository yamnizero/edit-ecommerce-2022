import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/data/datasource/remote/offers_data.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:get/get.dart';
import '../core/function/handlingData_controller.dart';


class OffersController extends GetxController{

  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listData  = response['data'] ;
        data.addAll(listData.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}