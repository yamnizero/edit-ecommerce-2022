import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommerc_2022/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommerc_2022/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController{

  OrdersArchiveData ordersArchiveData =OrdersArchiveData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  String printOrderType(String val){
    if(val == "0"){
      return "Delivery";
    }else{
      return "Receive";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepare";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  String printPaymentMethod  (String val){
    if(val == "0"){
      return "Cash On Delivery";
    }else{
      return " Payment Card";
    }
  }


  getOrders() async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData(myServices.sharedPreferences.getString("id")!);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder(){
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}