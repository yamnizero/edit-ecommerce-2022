import 'package:ecommerc_2022/controller/cart_controller.dart';
import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/view/widget/cart/button_cart.dart';
import 'package:ecommerc_2022/view/widget/cart/custom_button_coupon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;

  const BottomNavigationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalPrice,
      required this.controllerCoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              GetBuilder<CartController>(
                  builder: ((controller) =>
                      controller.couponName == null
                          ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllerCoupon,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    hintText: "Coupon Code",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomButtonCoupon(
                                textButton: "Apply ",
                                onPressed: onApplyCoupon,
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(child: Text(
                          "Coupon Code ${controller.couponName!}",
                        style: const TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold) ,
                      ))

    ),
    ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Price",
                          style: TextStyle(fontSize: 16),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$price \$",
                          style: const TextStyle(fontSize: 16),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Discount",
                          style: TextStyle(fontSize: 16),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$discount",
                          style: const TextStyle(fontSize: 16),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Shipping",
                          style: TextStyle(fontSize: 16),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$shipping",
                          style: const TextStyle(fontSize: 16),
                        )),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Total price",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$totalPrice \$",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            textButton: "Order",
            onPressed: () {
              controller.goToPageCheckOut();

              // Get.toNamed(AppRoutes.checkOut);
            },
          )
        ],
      ),
    );
  }
}
