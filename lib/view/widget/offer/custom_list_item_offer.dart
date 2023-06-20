import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerc_2022/controller/favorite_controller.dart';
import 'package:ecommerc_2022/controller/items_controller.dart';
import 'package:ecommerc_2022/controller/offers_controller.dart';
import 'package:ecommerc_2022/core/constant/imageasset.dart';
import 'package:ecommerc_2022/core/function/translate_date_base.dart';
import 'package:ecommerc_2022/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class CustomListItemsOffer extends GetView<OffersController> {
  final ItemsModel itemsModel;

  const CustomListItemsOffer({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              //change to pa
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                      AppLinkApi.imagesItems + "/" + itemsModel.itemsImage!,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    translateDataBase(
                        itemsModel.itemsNameAr!, itemsModel.itemsName!),
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDiscount} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontFamily: "sans",
                            fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] == "1"){
                                controller.setFavorite(itemsModel.itemsId,"0");
                                controller.removeFavorite(itemsModel.itemsId!);
                              }else{
                                controller.setFavorite(itemsModel.itemsId,"1");
                                controller.addFavorite(itemsModel.itemsId!);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.primaryColor,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            if(itemsModel.itemsDiscount != "0")
              Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(AppImageAsset.saleOne,width: 40,))
          ],
        ),
      ),
    );
  }
}
