import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class TestData{

  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.test,{});
    return response.fold((l) => l, (r) => r);
  }
}