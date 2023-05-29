import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/orders/notification_data.dart';
import 'package:get/get.dart';

class NotificationController  extends GetxController{

  NotificationData notificationData = NotificationData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices  = Get.find();
  getData()async{
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);
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
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}