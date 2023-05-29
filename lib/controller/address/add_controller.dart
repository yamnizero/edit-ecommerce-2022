import 'dart:async';

import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {

  StatusRequest statusRequest = StatusRequest.loading;

  Position? position;
  Completer<GoogleMapController>? completerController;
  CameraPosition? kGooglePlex ;

  List<Marker> markers =[];
  double? lat;
  double? long;
  addMarkers(LatLng latLng){
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1") , position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  getCurrentLocation() async {
     position = await Geolocator.getCurrentPosition();
     kGooglePlex =  CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 14.4746,
    );
     statusRequest = StatusRequest.none;
     update();
  }

   goToPageDetailsAddress(){
     Get.toNamed(AppRoutes.addAddressDetails,arguments: {
       "lat" : lat.toString(),
       "long" : long.toString(),
     });
   }



  @override
  void onInit() {
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
