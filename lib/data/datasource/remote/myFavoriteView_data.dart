import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class MyFavoriteViewData{

  Crud crud;
  MyFavoriteViewData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLinkApi.favoriteView,{"id" : id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLinkApi.deleteFromFavorite,{"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}