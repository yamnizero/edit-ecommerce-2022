
import 'package:ecommerc_2022/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Container(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            Center(child: Text("Notification"))
          ],
        ),
      ),
    );
  }
}
