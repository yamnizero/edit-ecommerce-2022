import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class AddressData{

  Crud crud;
  AddressData(this.crud);

  getData(String usersid,) async {
    var response = await crud.postData(AppLinkApi.addressView,{
      "usersid" : usersid ,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(
      String usersid,
      String name,
      String city,
      String street,
      String lat,
      String long,
      ) async {
    var response = await crud.postData(AppLinkApi.addressAdd,{
      "usersid" : usersid,
      "name" : name,
      "city" : city,
      "street" : street,
      "lat" :lat ,
      "long" : long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData( String addressid) async {
    var response = await crud.postData(AppLinkApi.addressDelete,{
      "addressid" : addressid,
    });
    return response.fold((l) => l, (r) => r);
  }


}