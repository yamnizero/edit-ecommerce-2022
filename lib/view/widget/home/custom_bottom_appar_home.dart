import 'package:ecommerc_2022/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button_appbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: ((controller) => BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(controller.listPage.length + 1, (index) {
            int i = index > 2 ? index - 1 : index;
            return index == 2
                ? const Spacer()
                : CustomButtonAppBar(
              onPressed: () {
                controller.changePage(i);
              },
              iconData: controller.bottomAppbar[i]['icon'],
              textButton: controller.bottomAppbar[i]['title'],
              active:
              controller.currentPage == i ? true : false,
            );
          })
        ],
      ),
    )));
  }
}
