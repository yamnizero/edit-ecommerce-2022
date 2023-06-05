import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class OfferData{

  Crud crud;
  OfferData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.offers,{});
    return response.fold((l) => l, (r) => r);
  }
}