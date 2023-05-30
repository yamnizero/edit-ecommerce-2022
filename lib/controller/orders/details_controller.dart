import 'package:ecommerc_2022/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersDetailsController extends GetxController{

  late OrdersModel ordersModel ;

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    // TODO: implement onInit
    super.onInit();
  }
}