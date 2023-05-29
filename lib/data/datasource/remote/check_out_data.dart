import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class CheckOutData {
  Crud crud;

  CheckOutData(this.crud);

  checkOut(Map data) async {
    var response = await crud
        .postData(AppLinkApi.checkOrders,data);
    return response.fold((l) => l, (r) => r);
  }
}
