import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerc_2022/controller/myFavoriteView_controller.dart';
import 'package:ecommerc_2022/core/function/translate_date_base.dart';
import 'package:ecommerc_2022/data/model/myFavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteViewController>{
  final MyFavoriteModel favoriteModel;

  const CustomListFavoriteItems({Key? key, required this.favoriteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${favoriteModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl:
                  AppLinkApi.imagesItems + "/" + favoriteModel.itemsImage!,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                translateDataBase(
                    favoriteModel.itemsNameAr!, favoriteModel.itemsName!),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 22,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                                (index) => const Icon(
                              Icons.star,
                              size: 15,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${favoriteModel.itemsPrice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontFamily: "sans",
                        fontWeight: FontWeight.bold),
                  ),
                 IconButton(
                   onPressed: (){
                     controller.deleteFromFavorite(favoriteModel.favoriteId!);
                   },
                   icon: const Icon(
                     Icons.delete_forever_outlined,
                     color: AppColor.primaryColor,
                   ),
                 )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
