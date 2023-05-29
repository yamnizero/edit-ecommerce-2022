import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String id, String userid) async {
    var response = await crud
        .postData(AppLinkApi.items, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
