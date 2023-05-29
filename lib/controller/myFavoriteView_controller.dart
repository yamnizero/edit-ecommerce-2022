import 'package:ecommerc_2022/core/class/Statusrequest.dart';
import 'package:ecommerc_2022/core/function/handlingData_controller.dart';
import 'package:ecommerc_2022/core/services/services.dart';
import 'package:ecommerc_2022/data/datasource/remote/myFavoriteView_data.dart';
import 'package:ecommerc_2022/data/model/myFavorite_model.dart';
import 'package:get/get.dart';

class MyFavoriteViewController extends GetxController {
  MyFavoriteViewData myFavoriteViewData = MyFavoriteViewData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteViewData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("========================== $response controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      //end
    }
    update();
  }

  deleteFromFavorite(String favoriteID) {
   // data.clear();
   // statusRequest = StatusRequest.loading;
    var response = myFavoriteViewData.deleteData(favoriteID);
    data.removeWhere((element) => element.favoriteId == favoriteID);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
