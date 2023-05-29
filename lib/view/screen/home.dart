import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerc_2022/controller/home_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:ecommerc_2022/link_api.dart';
import 'package:ecommerc_2022/view/widget/home/custom_list_categories_home.dart';
import 'package:ecommerc_2022/view/widget/home/custom_title_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../widget/custom_appbar.dart';
import '../widget/home/custom_card_suprise_home.dart';
import '../widget/home/custome_list_items_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomCardSurpriseHome(
                          titleSurprise: "A summer surprise",
                          bodySurprise: "Cashback 20%",
                        ),
                        CustomTitleHome(
                          titleHome: "Categories",
                        ),
                        CustomListCategoriesHome(),
                        CustomTitleHome(
                          titleHome: "Product for you",
                        ),
                        CustomListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(listDataSearch: controller.listData,),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataSearch;

  const ListItemsSearch({Key? key, required this.listDataSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listDataSearch.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              controller.goToPageProductDetails(listDataSearch[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLinkApi.imagesItems}/${listDataSearch[index].itemsImage}",
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listDataSearch[index].itemsName!),
                          subtitle: Text(listDataSearch[index].categoriesName!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
