import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class OrdersArchiveData{

  Crud crud;
  OrdersArchiveData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLinkApi.archiveOrders,{
      "id" : userId,
    });
    return response.fold((l) => l, (r) => r);
  }

}