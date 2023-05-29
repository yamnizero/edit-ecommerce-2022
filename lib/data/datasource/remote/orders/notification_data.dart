import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class NotificationData{

  Crud crud;
  NotificationData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLinkApi.notification,{"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}