import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String textButton;
  final bool? active;

  const CustomButtonAppBar({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.textButton,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primaryColor :AppColor.greyBottomAppBar,
          ),
          // Text(
          //   textButton,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primaryColor : AppColor.greyBottomAppBar),
          // )
        ],
      ),
    );
  }
}
