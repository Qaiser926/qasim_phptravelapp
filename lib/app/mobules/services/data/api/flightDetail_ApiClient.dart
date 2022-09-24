// import 'package:get/get.dart';

// class FlightDetailApiClient extends GetConnect implements GetxService {
//   late String token;
//   final String appBaseUrl;

//   late Map<String, String> _mainHeader;

//   FlightDetailApiClient({required this.appBaseUrl}) {
//     baseUrl = appBaseUrl;
//     timeout = Duration(seconds: 30);

//     _mainHeader = {
//       "Content-type": "Application/json, charset=UTF-8",
//       "Authorization": "Bearer $token",
//     };
//   }
//   Future<Response> getFlightDetailData(String url) async {
//     try {
//       var response = await get(url);
//       return response;
//     } catch (e) {
//       return Response(statusCode: 1, statusText: e.toString());
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/app/mobules/services/model/FlightDetail_ModelClass.dart';
import 'dart:convert' as convert;

var filterData;

class FlightDetailApiClientProvider {
  // var response=
  final String url2 = "https://randomuser.me/api/?results=10";
  final String url =
      'https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd';

  // Future<FlightDetailModelClass?> getFlightDetailData(String id) async {
  Future<FlightDetailModelClass?> getFlightDetailData() async {
    var response = await http.post(
        Uri.parse(
            'https://phptravels.net/api/api/hotel/detail?appKey=phptravels'),
        // body: {"hotel_id": id.toString(), "supplier": 1.toString()}
        body: {"hotel_id": 38.toString(), "supplier": 1.toString()}
        // headers: headers,
        );
    try {
      if (response.body == 200) {
        print('yaha tak to tike he ');
        return flightDetailModelClassFromJson(response.body);
      } else if (response.body.isNotEmpty) {
        print('yaha b tik he pir error kaha he');
        return flightDetailModelClassFromJson(response.body);
      } else {
        Get.snackbar('error', 'oop connection error');
        print('yaha par data nhe he ');
        // return null;
        return flightDetailModelClassFromJson(response.body);
      }
    } on PlatformException catch (e) {
      Get.snackbar('Error', 'yaha par error he ${e.toString()}');
    } catch (e) {
      print('dirct yaha par q ata he :$e');
    }
    return FlightDetailModelClass();
  }

  Future<FlightDetailModelClass> getDate() async {
    var respons;

    try {
      respons = await http.post(
          Uri.parse(
              'https://phptravels.net/api/api/hotel/detail?appKey=phptravels'),
          body: {"hotel_id": 38.toString(), "supplier": 1.toString()}
          // headers: headers,
          );
      // print('hello ');
      // print(respons.body);
      if (respons.statusCode == 200) {
        print('hello');
        var parsed = jsonDecode(respons.body.toString());
        filterData = FlightDetailModelClass.fromJson(parsed);
        print(filterData);

        print(filterData.name.toString());
        return filterData;
      }
// return filterData;

    } catch (e) {
      log("error occurs hahahahhahah : $e");
    }

    return FlightDetailModelClass();
  }
}
