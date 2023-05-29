import 'package:ecommerc_2022/controller/address/view_controller.dart';
import 'package:ecommerc_2022/core/class/handling_data_view.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      //العناوين
      appBar: AppBar(
        title: const Text("Address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
                itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onDeleteAddress: (){
                    controller.deleteAddress(controller.data[index].addressId!);
                  },
                );
                }),
            ),
          ),
        ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDeleteAddress;
  const CardAddress({Key? key, required this.addressModel,this.onDeleteAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle:Text(
              " City : ${addressModel.addressCity!}   Street : ${addressModel.addressStreet!} ",
          ) ,
          trailing: IconButton(
            onPressed: onDeleteAddress,
            icon: const Icon(Icons.delete_outlined),
          ),
        ),
      ),
    );
  }
}

