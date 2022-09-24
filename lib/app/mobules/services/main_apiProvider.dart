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
import 'package:phptravelapp/app/mobules/services/data/api/flightDetail_ApiClient.dart';
import 'dart:convert' as convert;

import '../homePage/HomeModel/homePageModelClass.dart';

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
    // final requestbody = json.decode(response.body);
    // print(requestbody.runtimeType);
    // print(response.headers);
    try {
      FlightDetailApiClientProvider().getDate();
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
        // return null;
        return homeOfferListModelClassFromJson(response.body);
      }
    } on PlatformException catch (e) {
      // print(e);
      // show_snackBarError(title: "Error", description: e.message.toString());
      // print('dirct yaha par q ata he$e');
      Get.snackbar('Error', 'yaha par error he ${e.toString()}');
    } catch (e) {
      print('dirct yaha par q ata he :$e');
      // print('yaha catch me error he ${e}');
    }
  }
}
