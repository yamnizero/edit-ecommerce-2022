import 'package:ecommerc_2022/controller/home_controller.dart';
import 'package:ecommerc_2022/core/function/translate_date_base.dart';
import 'package:ecommerc_2022/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class CustomListCategoriesHome extends GetView<HomeControllerImp> {
  const CustomListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 110,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
             i : index ,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel   categoriesModel;
  final int? i;
  const Categories( {Key? key,required this.categoriesModel, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories,i!,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.network(
              "${AppLinkApi.imagesCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          Text(
            "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(
                fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
