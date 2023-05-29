import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/material.dart';

class ToCardCart extends StatelessWidget {
  final String message;
  const ToCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColor.thirdColor,
          borderRadius: BorderRadius.circular(20)),
      child:  Text(
         message ,
        // "You Have 2 Items in Your List",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColor.primaryColor),
      ),
    );
  }
}
