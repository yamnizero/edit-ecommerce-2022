
import 'package:ecommerc_2022/controller/favorite_controller.dart';
import 'package:ecommerc_2022/controller/offers_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/offer/custom_list_item_offer.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController ());
    return GetBuilder<OffersController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => CustomListItemsOffer(
            itemsModel: controller.data[index],
          ),
        ),
      ),
    );
  }
}
