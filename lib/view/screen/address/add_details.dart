import 'package:ecommerc_2022/controller/address/add_details_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/shared/customButton.dart';
import 'package:ecommerc_2022/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controllerDetails =
    Get.put(AddAddressDetailsController());
    return Scaffold(
      //العناوين
      appBar: AppBar(
        title: const Text("Add details address"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<AddAddressDetailsController>(
          builder: (controller) =>
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                children: [
                  CustomTextFormAuth(
                    // here lang
                    hintText: "city",
                    label: "city",
                    iconData: Icons.location_city,
                    myController: controllerDetails.city,
                    valid: (val) {},
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    // here lang
                    hintText: "street",
                    label: "street",
                    iconData: Icons.streetview,
                    myController: controllerDetails.street,
                    valid: (val) {},
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    // here lang
                    hintText: "name",
                    label: "name",
                    iconData: Icons.near_me,
                    myController: controllerDetails.name,
                    valid: (val) {},
                    isNumber: false,
                  ),
                  CustomButton(text: "Add", onPressed: () {
                    print("====================================");
                    controller.addAddress();

                  },)
                ],
              ),
              ),
        ),
      ),
    );
  }
}
