import 'package:ecommerc_2022/controller/orders/details_controller.dart';
import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrdersDetails'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Table(
              children: const [
                TableRow(
                  children: [
                    Text("Item",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),
                    Text("QTY",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),
                    Text("Price",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),
                  ]
                ),
                TableRow(
                  children: [
                    Text("MacBook M1",textAlign: TextAlign.center,),
                    Text("2",textAlign: TextAlign.center,),
                    Text("1200",textAlign: TextAlign.center,),
                  ]
                ),
                TableRow(
                  children: [
                    Text("IPhone 14",textAlign: TextAlign.center,),
                    Text("2",textAlign: TextAlign.center,),
                    Text("4000",textAlign: TextAlign.center,),
                  ]
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text("Price : 2700\$" , textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold))),
            const SizedBox(height: 10,),
            Card(
              child: ListTile(
                title: Text('Address'),
                subtitle: Text('AlDisa streeat '),
              ),
            )
          ],
        ),
      ),
    );
  }
}
