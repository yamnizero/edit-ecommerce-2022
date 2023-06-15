import 'dart:io';
import 'package:ecommerc_2022/controller/home_screen_controller.dart';
import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/home/custom_bottom_appar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller) => Scaffold(
              body: WillPopScope(
                child: controller.listPage.elementAt(controller.currentPage),
                onWillPop: () {
                  Get.defaultDialog(
                      title: "Warning",
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.primaryColor),
                      middleText: "Do You Want To Exit The App ?",
                      cancelTextColor: AppColor.secondColor,
                      confirmTextColor: AppColor.secondColor,
                      buttonColor:  AppColor.thirdColor,
                      onCancel: () {},
                      onConfirm: () {
                        exit(0);
                      });
                  return Future.value(false);
                },
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoutes.cart);
                },
                child: const Icon(Icons.shopping_basket_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
            )));
  }
}
