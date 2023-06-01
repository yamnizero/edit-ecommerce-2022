import 'package:ecommerc_2022/controller/orders/pending_controller.dart';
import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listData;


  const CardOrdersList({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listData.ordersId}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  Jiffy(listData.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            Text(
              "Order Type : ${listData.ordersType}",
            ),
            Text(
              "Order Price : ${listData.ordersPrice} \$",
            ),
            Text(
              " DeliveryPrice : ${listData.ordersPricedelivery} \$",
            ),
            Text(
              " Payment Method : ${listData.ordersPaymentmethod}",
            ),
            Text(
              " Orders Status : ${controller.printOrderStatus(listData.ordersStatus!)}",
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price:  ${listData.ordersTotalprice} \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.ordersDetails , arguments: {
                       "ordersModel" : listData
                    });
                  },
                  child: const Text(
                    "Details",
                  ),
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                ),
                const SizedBox(width: 10,),
                 if(listData.ordersStatus! == "0") MaterialButton(
                  onPressed: () {
                   controller.deleteOrders(listData.ordersId!);
                  },
                  child: const Text(
                    "Delete",
                  ),
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
