import 'package:ecommerc_2022/core/class/crud.dart';
import 'package:ecommerc_2022/link_api.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLinkApi.cartAdd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.cartDelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.getCountItems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response =
        await crud.postData(AppLinkApi.cartView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname)  async {
    var response =
        await crud.postData(AppLinkApi.checkCoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
