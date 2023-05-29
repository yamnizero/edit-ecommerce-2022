import 'package:ecommerc_2022/core/constant/name_routes.dart';
import 'package:ecommerc_2022/core/middleware/my_middleware.dart';
import 'package:ecommerc_2022/view/screen/address/add_address.dart';
import 'package:ecommerc_2022/view/screen/address/add_details.dart';
import 'package:ecommerc_2022/view/screen/address/view_address.dart';
import 'package:ecommerc_2022/view/screen/auth/forgetPassword/forget_password.dart';
import 'package:ecommerc_2022/view/screen/auth/forgetPassword/verify_code.dart';
import 'package:ecommerc_2022/view/screen/auth/login.dart';
import 'package:ecommerc_2022/view/screen/auth/forgetPassword/reset_password.dart';
import 'package:ecommerc_2022/view/screen/auth/signup.dart';
import 'package:ecommerc_2022/view/screen/auth/forgetPassword/success_reset_password.dart';
import 'package:ecommerc_2022/view/screen/auth/success_signup.dart';
import 'package:ecommerc_2022/view/screen/auth/verify_code_signup.dart';
import 'package:ecommerc_2022/view/screen/cart.dart';
import 'package:ecommerc_2022/view/screen/checkout.dart';
import 'package:ecommerc_2022/view/screen/home_screen.dart';
import 'package:ecommerc_2022/view/screen/items.dart';
import 'package:ecommerc_2022/view/screen/myFavorite.dart';
import 'package:ecommerc_2022/view/screen/onboarding.dart';
import 'package:ecommerc_2022/view/screen/orders/pending.dart';
import 'package:ecommerc_2022/view/screen/product_details.dart';

import 'package:get/get.dart';

import 'view/screen/language.dart';


List<GetPage<dynamic>>? routes= [

  GetPage(name: "/", page: ()=> const Language(),middlewares: [MyMiddleware()]),

  ///Auth
  GetPage(name: AppRoutes.login, page: ()=> const Login()) ,
  GetPage(name: AppRoutes.signUp, page: ()=> const SignUp()) ,
  GetPage(name: AppRoutes.successSignUp, page: ()=> const SuccessSignUp()) ,
  GetPage(name: AppRoutes.forgetPassword, page: ()=> const ForgetPassword()) ,
  GetPage(name: AppRoutes.verifyCode, page: ()=> const VerifyCode()) ,
  GetPage(name: AppRoutes.resetPassword, page: ()=> const ResetPassword()) ,
  GetPage(name: AppRoutes.successResetPassword, page: ()=> const SuccessResetPassword()) ,
  GetPage(name: AppRoutes.verifyCodeSignUp, page: ()=> const VerifyCodeSignUp()) ,
  ///onBoarding
  GetPage(name: AppRoutes.onBoarding, page: ()=> const OnBoarding()) ,

  ///HomePage
  GetPage(name: AppRoutes.homePage, page: ()=> const HomeScreen()) ,
  GetPage(name: AppRoutes.itemsPage, page: ()=> const Items()) ,
  GetPage(name: AppRoutes.productDetails, page: ()=> const ProductDetails()) ,
  GetPage(name: AppRoutes.myFavorite, page: ()=> const MyFavorite()) ,
  GetPage(name:  AppRoutes.cart, page: () => const Cart()),

  ///Address
  GetPage(name: AppRoutes.viewAddress, page: ()=> const ViewAddress()) ,
  GetPage(name: AppRoutes.addAddress, page: ()=> const AddAddress()) ,
  GetPage(name: AppRoutes.addAddressDetails, page: ()=> const AddAddressDetails()) ,

  ///CheckOut
  GetPage(name: AppRoutes.checkOut, page: ()=> const CheckOut()) ,
  GetPage(name: AppRoutes.pendingOrders, page: ()=> const PendingOrders()) ,

];