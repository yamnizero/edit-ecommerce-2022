import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class HomeData{

  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.homePage,{});
    return response.fold((l) => l, (r) => r);
  }

  //search---
  searchData(String search) async {
    var response = await crud.postData(AppLinkApi.searchItems,{"search" : search});
    return response.fold((l) => l, (r) => r);
  }
}