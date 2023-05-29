import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?)  valid;
  final bool isNumber ;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth(
      {Key? key,
        required this.hintText,
        required this.label,
        required this.iconData,
        required this.myController,
        required this.valid,
        required this.isNumber,
         this.obscureText,
         this.onTapIcon,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: valid,
        keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true)  : TextInputType.text,
        controller: myController,
        obscureText: obscureText == null || obscureText == false ? false : true ,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(label)),
            suffixIcon: InkWell(
                onTap: onTapIcon,
                child: Icon(iconData)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
