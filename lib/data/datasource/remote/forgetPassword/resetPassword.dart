import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class ResetPasswordData{

  Crud crud;
  ResetPasswordData(this.crud);

  postData(String password,String email) async {
    var response = await crud.postData(AppLinkApi.resetPassword,{
      "email" : email,
      "password" : password,
    });
    return response.fold((l) => l, (r) => r);
  }
}