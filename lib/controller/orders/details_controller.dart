import 'dart:async';

import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerc_2022/data/model/cart_model.dart';
import 'package:ecommerc_2022/data/model/orders_model.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;

  OrdersDetails ordersDetailsData = OrdersDetails(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  Completer<GoogleMapController>? completerController;
  List<Marker> markers = [];
  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  initialData() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)),
      zoom: 12.4746,
    );
    markers.add(
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(
          double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!),
        ),
      ),
    );
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    initialData();
    getData();
    // TODO: implement onInit
    super.onInit();
  }


  getData()async{
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("========================== $response controller");
    statusRequest  = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
