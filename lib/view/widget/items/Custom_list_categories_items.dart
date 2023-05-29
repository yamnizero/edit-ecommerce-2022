import 'package:ecommerc_2022/controller/home_controller.dart';
import 'package:ecommerc_2022/controller/items_controller.dart';
import 'package:ecommerc_2022/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/function/translate_date_base.dart';

class CustomListCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomListCategoriesItems({Key? key}) : super(key: key);

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

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel   categoriesModel;
  final int? i;
  const Categories( {Key? key,required this.categoriesModel, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //controller.goToItems(controller.categories,i!);
        controller.changeCat(i!,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
            padding: const EdgeInsets.only(right: 10,left: 10,bottom: 5),
            decoration: controller.selectedCategories == i ?  const BoxDecoration(
                border:Border(bottom: BorderSide(width: 3,color: AppColor.primaryColor))
            ) :null ,
            child: Text(
              "${translateDataBase(categoriesModel.categoriesNameAr,categoriesModel.categoriesName)}",
              style: const TextStyle(
                fontSize: 20, color: AppColor.black,),
            ),
          ))
        ],
      ),
    );
  }
}
