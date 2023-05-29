 import 'package:ecommerc_2022/core/constant/color.dart';
import 'package:flutter/material.dart';


 /// ThemeData English --------
ThemeData themeEnglish =  ThemeData(
  fontFamily: "PlayfairDisplay",
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:  AppColor.primaryColor,
  ),
  appBarTheme:  AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "PlayfairDisplay"
    ),
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black),
    headline2: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    bodyText2: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

/// ThemeData Arabic ---------
ThemeData themeArabic =  ThemeData(
  fontFamily: "Cairo",
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:  AppColor.primaryColor,
  ),
  appBarTheme:  AppBarTheme(
    centerTitle: true,
    elevation: 0.0,

    titleTextStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily:"Cairo",
    ),
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black),
    headline2: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    bodyText2: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);