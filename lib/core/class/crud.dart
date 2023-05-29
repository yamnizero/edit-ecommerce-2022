import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerc_2022/core/function/check_internet.dart';
import 'Statusrequest.dart';
import 'package:http/http.dart' as http;

/// create-read-update-delete

class Crud{
  Future<Either<StatusRequest,Map>> postData(String linkUrl,Map data) async {

     try{
       // bad state
       if(!(await checkInternet()))   return const Left(StatusRequest.offlineFailure);

         var response = await http.post(Uri.parse(linkUrl), body: data);
         print([response.statusCode, response.body]);
         // bad state
         if(!(response.statusCode == 200 || response.statusCode == 201))   return const Left(StatusRequest.serverFailure);
         //valid state
       Map responseBody = jsonDecode(response.body);
           print(responseBody);
           return Right(responseBody);

     }catch(_){
       return const Left(StatusRequest.serverFailure);
     }
   }

   Future<Map> postData2(String link, Map data) async {
    try{
      // if no internet connection throw appException
      if(!(await checkInternet())) throw AppException(StatusRequest.offlineFailure);

      var response = await http.post(Uri.parse(link), body: data);
      print(response.statusCode);
      // if not valida statuscode throw appExp
      if(!(response.statusCode == 200 || response.statusCode == 201)) throw AppException(StatusRequest.serverException);
      // else decode json body
        Map responseBody = jsonDecode(response.body);
        print(responseBody);
        return responseBody;
    }catch(e,trace){
      print(e);
      rethrow;
    }
   }
  }

  class AppException {
  final StatusRequest request;
  AppException(this.request);
  }
