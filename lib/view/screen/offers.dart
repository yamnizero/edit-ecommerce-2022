import 'package:ecommerc_2022/controller/favorite_controller.dart';
import 'package:ecommerc_2022/controller/offers_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/view/screen/home.dart';
import 'package:ecommerc_2022/view/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/offer/custom_list_item_offer.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
              myController: controller.search!,
              titleAppbar: "Find Product",
              // opPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              opPressedIconFavorite: () {
                Get.toNamed(AppRoutes.myFavorite);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            !controller.isSearch
                ? HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CustomListItemsOffer(
                        itemsModel: controller.data[index],
                      ),
                    ),
                  )
                : ListItemsSearch(
                    listDataSearch: controller.listData,
                  ),
          ],
        ),
      ),
    );
  }
}
