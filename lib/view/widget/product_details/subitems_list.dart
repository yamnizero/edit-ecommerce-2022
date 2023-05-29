import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_details_controller.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        ...List.generate(controller.subItems.length, (index) => Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 5),
          height: 60,
          width: 90,
          decoration: BoxDecoration(
            color: controller.subItems[index]['active'] == "1" ? AppColor.black  : Colors.white,
            border: Border.all(color: AppColor.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Text(
            controller.subItems[index]['name'],
            style:  TextStyle(
                color: controller.subItems[index]['active'] == "1" ?Colors.white  : AppColor.black,
                fontWeight: FontWeight.bold),
          ),
        ),),

      ],
    );
  }
}
