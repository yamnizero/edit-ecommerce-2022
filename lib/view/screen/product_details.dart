import 'package:ecommerc_2022/controller/product_details_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/view/widget/product_details/top_page_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/product_details/price_and_qu.dart';
import '../widget/product_details/subitems_list.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 45,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: const Text(
            "Go To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const TopProductPageDetails(),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.itemsModel.itemsName}",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: AppColor.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WidgetPriceAndCountItems(
                      onAdd: () {

                        controller.add();
                      },
                      onRemove: () {

                        controller.remove();
                      },
                      price: "${controller.itemsModel.itemsPriceDiscount}",
                      count: "${controller.countItems}",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColor.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "Color",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .headline1!
                    //       .copyWith(color: AppColor.black),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const SubItemsList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
