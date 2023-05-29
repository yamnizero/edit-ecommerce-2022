import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String title;
  final String imageName;
  final bool isActive ;
  const CardDeliveryTypeCheckOut({Key? key, required this.title, required this.isActive, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          color: isActive  ? AppColor.secondColor :null,
          border: Border.all(color: AppColor.secondColor)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 60,
            color:isActive ? Colors.white: null,
          ),
           Text(
            title,
            style:  TextStyle(
              color: isActive ? Colors.white : AppColor.secondColor,
              fontWeight: FontWeight.bold  ,
            ),
          ),
        ],
      ),
    );
  }
}
