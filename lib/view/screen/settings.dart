import 'package:ecommerc_2022/controller/settings_controller.dart';
import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:ecommerc_2022/core/constant/imageasset.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: const AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ListTile(
                  //   title: const Text('Disable Notification'),
                  //   trailing: Switch(
                  //     onChanged: (val) {},
                  //     value: true,
                  //   ),
                  //   // onTap: (){},
                  // ),
                  const Divider(),
                  ListTile(
                    title: const Text('Orders'),
                    trailing: const Icon(Icons.card_travel),
                    onTap: () {
                      Get.toNamed(AppRoutes.pendingOrders);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Archive'),
                    trailing: const Icon(Icons.archive),
                    onTap: () {
                      Get.toNamed(AppRoutes.archiveOrders);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Address'),
                    trailing: const Icon(Icons.location_on_outlined),
                    onTap: () {
                      Get.toNamed(AppRoutes.viewAddress);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('About us'),
                    trailing: const Icon(Icons.help_rounded),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Contact us'),
                    trailing: const Icon(Icons.phone_callback_outlined),
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+249907970206"));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Logout'),
                    trailing: const Icon(Icons.exit_to_app),
                    onTap: () {
                      controller.logOut();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
