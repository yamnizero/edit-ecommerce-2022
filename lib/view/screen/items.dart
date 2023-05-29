import 'package:ecommerc_2022/controller/items_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:ecommerc_2022/view/screen/home.dart';
import 'package:ecommerc_2022/view/widget/items/custom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../widget/custom_appbar.dart';
import '../widget/items/Custom_list_categories_items.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp  controller = Get.put(ItemsControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
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
          const CustomListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch ?GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        favoriteController.isFavorite[controller.data[index]
                            ['items_id']] = controller.data[index]['favorite'];
                        return CustomListItems(
                          itemsModel:
                              ItemsModel.fromJson(controller.data[index]),
                        );
                      }): ListItemsSearch(listDataSearch: controller.listData,),)),
        ]),
      ),
    );
  }
}
