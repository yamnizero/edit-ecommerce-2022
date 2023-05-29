import 'package:ecommerc_2022/controller/orders/pending_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/view/widget/order/orders_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/////

class PendingOrders extends StatelessWidget
{
  const PendingOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
          builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: ((context, index) => CardOrdersList(
              listData: controller.data[index],
            )),
          ))
          ),
        ),
      ),
    );
  }
}


