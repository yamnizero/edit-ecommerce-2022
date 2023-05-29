import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class LoginData{

  Crud crud;
  LoginData(this.crud);

  postData(String email,String password) async {
    var response = await crud.postData(AppLinkApi.login,{
      "email" : email,
      "password" : password
    });
    return response.fold((l) => l, (r) => r);
  }
}