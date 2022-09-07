//
// import 'dart:convert';
//
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:flutter/services.dart';
// // import 'package:flutter/services.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:http/http.dart' as http;
// import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
// /*
// class ApiProvider{
//   // Future<List<HomeOfferListModelClass>> getUserData() async {
//   Future<HomeOfferListModelClass?> getUserData() async {
//
//     final url="https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd";
//
//     var response=await http.get(Uri.parse('https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd'));
//    final resquestbody=json.decode(response.body.toString());
//    print(response.body);
//    try{
//      if(response.statusCode==200){
//        print('yaha par tik he ');
//        return homeOfferListModelClassFromJson(response.body);
//      }else if(response.body.isNotEmpty){
//        print('yaha par b data araha he .');
//        return homeOfferListModelClassFromJson(response.body.toString());
//      }else{
//        Get.snackbar('error', 'oop connection error');
//        print('yaha par data nhe he ');
//        return null;
//      }
//    } on PlatformException catch(e){
//      Get.snackbar('Error', 'yaha par error a giya he ${e}');
//    }catch (e){
//      print('dirct yaha par q ata he');
//      print('yaha catch me error he ${e}');
//    }
//
//     //
//     // var response=await rootBundle.rootBundle.loadString('jsonfile/php_travel_jsondata.json');
//     // print(response);
//     // // final resquestbody=json.decode(response.body.toString());
//     // final resquestbody=json.decode(response.toString());
//     // final list=json.decode(response) as List<dynamic>;
//     // return list.map((e) => HomeOfferListModelClass.fromJson(e)).toList();
// }
//
// }
// */
// class ApiProvider {
//   static Future<HomeOfferListModelClass?> getUserData() async {
//
//     var response = await http.get(
//       Uri.parse("https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd"),
//
//     );
//     print("ikikikikik");
//     print(response.body);
//
//     final requestbody = json.decode(response.body);
//     try {
//       if (response.body.isNotEmpty &&
//           requestbody["status"].toString() == "200") {
//         print("kukuku");
//         try {
//           homeOfferListModelClassFromJson(response.body);
//         } catch (e) {
//           print(e);
//         }
//         return homeOfferListModelClassFromJson(response.body);
//       } else if (response.body.isNotEmpty) {
//         return homeOfferListModelClassFromJson(response.body);
//       } else {
//         Get.snackbar('Error', 'Oops , server is down');
//         return null;
//       }
//     } on PlatformException catch (e) {
//       print(e);
//       Get.snackbar('Error', e.message.toString());
//     } catch (e) {}
//   }
// }
// // import 'dart:convert';
// //
// // import 'package:flutter/services.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_navigation/get_navigation.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
// // class ApiProvider{
// //
// //   Future<HomeOfferListModelClass?> getUserData() async {
// //
// //     final url="https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd";
// //     var response=await http.get(Uri.parse(url));
// //     print(response.body);
// //     final resquestbody=json.decode(response.body.toString());
// //     try{
// //       if(response.statusCode==200){
// //         print('yaha par tik he ');
// //         return homeOfferListModelClassFromJson(response.body);
// //       }else if(response.body.isNotEmpty){
// //         print('yaha par b data araha he .');
// //         return homeOfferListModelClassFromJson(response.body.toString());
// //       }else{
// //         Get.snackbar('error', 'oop connection error');
// //         print('yaha par data nhe he ');
// //         return null;
// //       }
// //     } on PlatformException catch(e){
// //       Get.snackbar('Error', 'yaha par error a giya he ${e}');
// //     }catch (e){
// //       print('dirct yaha par q ata he');
// //       print('yaha catch me error he ${e}');
// //     }
// //   }
// //
// // }

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert' as convert;

import '../HomeModel/homePageModelClass.dart';

class ApiProvider {
  // var response=
  final String url2 = "https://randomuser.me/api/?results=10";
  final String url =
      'https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd';

  // Box? box;
  //
  // Future openBox() async{
  //   var dir=await getApplicationDocumentsDirectory();
  //   Hive.init(dir.path);
  //   box=await Hive.openBox('data');
  //   return;
  // }
  // getAllData() async {
  //   // await openBox();
  //   String url='http://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd';
  // }

  static Future<HomeOfferListModelClass?> getUserData() async {
    // var url2=Uri.parse("https://randomuser.me/api/?results=10");
    // var url = Uri.parse("https://demotravels.com/api/api/main/app?appKey=phptravels&lang=en&currency=usd");
    var response = await http.get(
      Uri.parse(
          'http://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd'),
      // headers: headers,
    );
    // print(response.body);
    final requestbody = json.decode(response.body);
    print(requestbody.runtimeType);
    //  print(response.body);
    try {
      if (response.body == 200) {
        print('yaha tak to tike he ');
        return homeOfferListModelClassFromJson(response.body);
      } else if (response.body.isNotEmpty) {
        print('yaha b tik he pir error kaha he');
        return homeOfferListModelClassFromJson(response.body);
        // return homeOfferListModelClassFromJson(requestbody);
      } else {
        // show_snackBarError(title: "Error", description: "Oops, server is down");
        Get.snackbar('error', 'oop connection error');
        print('yaha par data nhe he ');
        return null;
      }
    } on PlatformException catch (e) {
      // print(e);
      // show_snackBarError(title: "Error", description: e.message.toString());
      print('dirct yaha par q ata he');
      Get.snackbar('Error', 'yaha par error he ${e.toString()}');
    } catch (e) {
      print('dirct yaha par q ata he');
      // print('yaha catch me error he ${e}');
    }
  }
}


//
// class ApiProvider {
//   // var response=
//   final String url2="https://randomuser.me/api/?results=10";
//   final String url='https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd';
//
//   List<HomeOfferListModelClass> _postList =<HomeOfferListModelClass>[];
//   static Future<HomeOfferListModelClass?> getUserData() async {
//     var url2=Uri.parse("https://randomuser.me/api/?results=10");
//     var url = Uri.parse("https://demotravels.com/api/api/main/app?appKey=phptravels&lang=en&currency=usd");
//     var response = await http.get(
//       Uri.parse('https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd'),
//       // headers: headers,
//     );
//
//     final requestbody = json.decode(response.body.toString());
//     print(requestbody.runtimeType);
//     print(response.body);
//     try {
//       if (response.body==200) {
//         print('yaha tak to tike he ');
//         return homeOfferListModelClassFromJson(response.body);
//       }else if (response.body.isNotEmpty) {
//         print('yaha b tik he pir error kaha he');
//         return homeOfferListModelClassFromJson(response.body.toString());
//         // return homeOfferListModelClassFromJson(requestbody);
//       } else {
//         // show_snackBarError(title: "Error", description: "Oops, server is down");
//         Get.snackbar('error', 'oop connection error');
//         print('yaha par data nhe he ');
//         return null;
//       }
//     }
//     on PlatformException catch (e) {
//       // print(e);
//       // show_snackBarError(title: "Error", description: e.message.toString());
//       print('dirct yaha par q ata he');
//       Get.snackbar('Error', 'yaha par error he ${e.toString()}');
//     }
//     catch (e) {
//       print('dirct yaha par q ata he');
//       print('yaha catch me error he ${e}');
//     }
//   }
// }
