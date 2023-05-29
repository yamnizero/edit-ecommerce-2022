import 'package:ecommerc_2022/view/screen/home.dart';
import 'package:ecommerc_2022/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController{

  int currentPage =0;

  List<Widget> listPage =[
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("Setting"),)],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("Profile"),)],
    ),
    const Settings(),
  ];

  List bottomAppbar =[
    {
      "title" : "home",
      "icon" : Icons.home
    },
    {
      "title" : "notify",
      "icon" : Icons.notifications_active_outlined
    },
    {
      "title" : "profile",
      "icon" : Icons.person_pin_sharp
    },
    {
      "title" : "settings",
      "icon" : Icons.settings
    },
  ];


  @override
  changePage(int i) {
    currentPage = i ;
    update();
  }

}