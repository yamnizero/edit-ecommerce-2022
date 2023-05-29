import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class CheckEmailData{

  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLinkApi.checkEmail,{
      "email" : email,

    });
    return response.fold((l) => l, (r) => r);
  }
}