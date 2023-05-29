import 'package:ecommerc_2022/controller/myFavoriteView_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/myFavorite/custom_list_favoriteItems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteViewController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteViewController>(
            builder: (((controller) => ListView(
                  children: [
                    // CustomAppBar(
                    //   titleAppbar: "Find Product",
                    //
                    //   onPressedSearch: () {},
                    //   opPressedIconFavorite: () {
                    //     Get.toNamed(AppRoutes.myFavorite);
                    //   },
                    // ),
                    const SizedBox(height: 20,),
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                          itemCount: controller.data.length,
                          shrinkWrap:true,
                          physics:const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            return  CustomListFavoriteItems(
                              favoriteModel: controller.data[index],
                            );
                          }
                          ),
                        )
                  ],
                ))),
          )),
    );
  }
}
