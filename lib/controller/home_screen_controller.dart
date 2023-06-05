import 'package:ecommerc_2022/view/screen/home.dart';
import 'package:ecommerc_2022/view/screen/notification.dart';
import 'package:ecommerc_2022/view/screen/offers.dart';
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
    const NotificationScreen(),
    const OffersView(),
    const Settings(),
  ];

  List bottomAppbar =[
    {
      "title" : "home",
      "icon" : Icons.home
    },
    {
      "title" : "notifications",
      "icon" : Icons.notifications_active_outlined
    },
    {
      "title" : "offers",
      "icon" : Icons.local_offer_outlined
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