import 'dart:async';

import 'package:ecommerc_2022/data/model/orders_model.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController{

  late OrdersModel ordersModel ;

  Completer<GoogleMapController>? completerController;
  List<Marker> markers =[];
  double? lat;
  double? long;

  CameraPosition? cameraPosition ;
  initialData(){
    cameraPosition =  CameraPosition(
      target: LatLng(35.22, 37.3),
      zoom: 12.4746,
    );
  }

  @override
  void onInit() {

    ordersModel = Get.arguments['ordersModel'];
    initialData();
    // TODO: implement onInit
    super.onInit();
  }
}