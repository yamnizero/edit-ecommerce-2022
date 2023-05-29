import 'package:ecommerc_2022/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestPermissionNotification() async {
NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
    sound: true,
);
}

fcmConfig(){
  FirebaseMessaging.onMessage.listen((message) {
    print("+===============================Notification======");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data){
  print("====================== page id");
  print(data['pageid']);
  print("====================== page name");
  print(data['pagename']);
  print("====================== Current Route");
  print(Get.currentRoute);
  if(Get.currentRoute == "/pendingOrders" && data['pagename'] == "refreshOrderPending") {
    OrdersPendingController controller =Get.find();
    controller.refreshOrder();
  }

}


/// realTime
// firebase + stream
//Socket io
//Notification refresh
