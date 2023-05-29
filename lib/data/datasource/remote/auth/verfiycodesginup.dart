import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class VerifyCodeSignUpData{

  Crud crud;
  VerifyCodeSignUpData(this.crud);

  postData(String email,String verifyCode) async {
    var response = await crud.postData(AppLinkApi.verifyCodeSignUp,{
      "email" : email,
      "verifycode" : verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendVerifyCode(String email) async{
    var response = await crud.postData(AppLinkApi.resend,{
      "email" : email
    });
    return response.fold((l) => l, (r) => r);
  }
}