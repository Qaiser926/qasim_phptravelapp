//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:phptravelapp/app/mobules/homePage/api_servies/api_provider.dart';
// import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';
//
// import '../HomeModel/homePageModelClass.dart';
//
// class HomeController extends GetxController{
//
//   RxInt currentIndex=0.obs;
//
//   var name=''.obs;
//   var isLoading=false.obs;
//   var model=HomeOfferListModelClass().obs;
//   var isEmptyData=false.obs;
//
//
//
//   List<Widget> homeViewWidget = [
//     BottomNavigationBarPage(),
//     // SearchFlightView(),
//     // MyTripCompleteView(),
//     // OffersView(),
//     // ProfileView(),
//   ];
//
//   // List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;
//   //
//   // @override
//   // void onInit(){
//   //   super.onInit();
//   //   fetchTourData();
//   // }
//   //
//   // fetchTourData() async{
//   //
//   //   List<TourAppModel> modelClass=[
//   //
//   //     TourAppModel(
//   //       name: 'lahore',
//   //       id: 4,
//   //       price: 25,
//   //       star: 5,
//   //       image: 'https://images.unsplash.com/photo-1543536775-f62c9e0ca216?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//   //       des: 'this is lahore ',
//   //     ),
//   //     TourAppModel(
//   //       name: 'lahore',
//   //       id: 4,
//   //       price: 235,
//   //       star: 1,
//   //       image: 'https://images.unsplash.com/photo-1572015833682-3d3633889189?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=338&q=80',
//   //       des: 'this is karachi',
//   //     ), TourAppModel(
//   //       name: 'karachi',
//   //       id: 4,
//   //       price: 27,
//   //       star: 3.5,
//   //       image: 'https://images.unsplash.com/photo-1615281378393-6225797ba2b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//   //       des: 'this is london',
//   //     ), TourAppModel(
//   //       name: 'london',
//   //       id: 4,
//   //       price: 45,
//   //       star: 4.1,
//   //       image: 'https://images.unsplash.com/photo-1572015833682-3d3633889189?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=338&q=80',
//   //       des: 'this is view',
//   //     ), TourAppModel(
//   //       name: 'room',
//   //       id: 4,
//   //       price: 85,
//   //       star: 1.5,
//   //       image: 'https://images.unsplash.com/photo-1643841368618-4aa128ae63c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//   //       des: 'this is beautiful room',
//   //     ), TourAppModel(
//   //       name: 'china',
//   //       id: 4,
//   //       price: 125,
//   //       star: 2.3,
//   //       image: 'https://images.unsplash.com/photo-1543536775-f62c9e0ca216?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//   //       des: 'this is china',
//   //     ),
//   //
//   //
//   //
//   //
//   //   ];
//   //   modelDataList.assignAll(modelClass);
//   //   print(modelClass);
//   //   update();
//   //
//   // }
//
//   @override
//   void onInit()  {
//     // TODO: implement onInit
//     super.onInit();
//     // fatchProductList();
//
//   }
//   fatchProductList() async {
//     // print("tapped $id");
//     try {
//       isLoading(true);
//       var product = await ApiProvider.getUserData();
//       print(product);
//       if (product is HomeOfferListModelClass) {
//         print("data not null");
//         model.value = product as HomeOfferListModelClass;
//         update();
//       } else {
//         isEmptyData(true);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/modelClass.dart';
import 'package:phptravelapp/app/mobules/services/main_apiProvider.dart';
import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';

// class HomeController extends GetxController with StateMixin<List<dynamic>> {
// class HomeController extends GetxController with StateMixin<List<dynamic>>{

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  var name = "".obs;
  var isLoading = false.obs;
  var modal = HomeOfferListModelClass().obs;
  var isEmptyData = false.obs;
  // List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;

  List<HomeOfferListModelClass> homeofferControlerList =
      <HomeOfferListModelClass>[].obs;

  // List<HomeOfferListModelClass> _productModelListData =
  //     List<HomeOfferListModelClass>.empty().obs;
  // List<HomeOfferListModelClass> get productModelListData =>
  //     _productModelListData;

  List<Widget> homeViewWidget = [BottomNavigationBarPage()];
  @override
  void onInit() {
    super.onInit();
    ApiProvider.getUserData();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

// original data
  fatchProductList() async {
    // print("tapped $id");
    try {
      isLoading(true);
      var product = await ApiProvider.getUserData();

      if (product is HomeOfferListModelClass) {
        print("data not null");
        modal.value = product as HomeOfferListModelClass;
        update();
      } else {
        isEmptyData(true);
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  /*Box? box;
  List data=[];
  Future openBox() async{
    var dir=await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box=await Hive.openBox('data');
    return;
  }

  Future<bool> getAllData() async{
    await openBox();

    String url='https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd';
    try{
      var response=await http.get(Uri.parse(url));
      // print(response.body);
      var _jsonDecode=jsonDecode(response.body);

      await putData(_jsonDecode);
    }catch(sockeException){
      print('No internet');
    }
    // get the data from dm
    var mymap=box!.toMap().values.toList();
    if(mymap.isEmpty){
      data.add('empty');

    }else{
      data=mymap;
    }
    return Future.value(true);
  }



  Future putData(data) async{
    await box!.clear();
    // insert data
    for(var d in data){
      box!.add(d);
    }
  }
*/
  void cleanUpTask() {
    print('clean up task');
  }

  //
  //
  // fetchTourData() async{
  //
  //   List<TourAppModel> modelClass=await [
  //
  //     TourAppModel(
  //       image: 'images/hotel.svg',
  //     ),
  //     TourAppModel(
  //       image: 'images/plane.svg',
  //     ),
  //     TourAppModel(
  //       image: 'images/bus.svg',
  //     ),
  //     TourAppModel(
  //       image: 'images/visa_card.svg',
  //     ),
  //   ];
  //   modelDataList.assignAll(modelClass);
  //   print(modelClass);
  //   update();
  //
  // }

}


/*
class HomeController extends GetxController {


  var name = "".obs;
  var isLoading = false.obs;
  var modal = HomeOfferListModelClass().obs;
  var isEmptyData = false.obs;

  List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;
  HomeOfferListModelClass? _homeOfferListModelClass;
  static Future<dynamic> getUserData() async {
    var url2=Uri.parse("https://randomuser.me/api/?results=10");
    var url = Uri.parse("https://demotravels.com/api/api/main/app?appKey=phptravels&lang=en&currency=usd");
    var response = await http.get(
      Uri.parse('https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd'),
      // headers: headers,
    );
    // print(response.body);
    final requestbody = json.decode(response.body);
    print(requestbody.runtimeType);
    // print(response.body);
       try {
        if (response.body==200) {
          print('yaha tak to tike he ');
          return homeOfferListModelClassFromJson(response.body);
        }else if (response.body.isNotEmpty) {
          print('yaha b tik he pir error kaha he');
          return homeOfferListModelClassFromJson(response.body);
          // return homeOfferListModelClassFromJson(requestbody);
        } else {
          // show_snackBarError(title: "Error", description: "Oops, server is down");
          Get.snackbar('error', 'oop connection error');
          print('yaha par data nhe he ');
          return null;
        }
      }
      on PlatformException catch (e) {
        // print(e);
        // show_snackBarError(title: "Error", description: e.message.toString());
        print('dirct yaha par q ata he');
        Get.snackbar('Error', 'yaha par error he ${e.toString()}');
      }
      catch (e) {
        print('dirct yaha par q ata he');
        // print('yaha catch me error he ${e}');
      }
  }

 *//* RxInt currentIndex = 0.obs;

  var name = "".obs;
  var isLoading = false.obs;
  var modal = HomeOfferListModelClass().obs;
  var isEmptyData = false.obs;

  List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;


  List<Widget> homeViewWidget = [
    BottomNavigationBarPage()
  ];


  @override
  void onInit() {
    super.onInit();

    fatchProductList();
  }

  fatchProductList() async {
    // print("tapped $id");
    try {

      isLoading(true);
      var product = await ApiProvider.getUserData();
      print("yaha product data to araha he :${product}");
      if (product is HomeOfferListModelClass) {
        print("data not null");
        modal.value = product as HomeOfferListModelClass;
        update();
      } else {
        isEmptyData(true);
      }
    } finally {
      isLoading(false);
    }
  }
  @override
  void onReady() {
    super.onReady();
  }*//*


//
//
// fetchTourData() async{
//
//   List<TourAppModel> modelClass=await [
//
//     TourAppModel(
//       image: 'images/hotel.svg',
//     ),
//     TourAppModel(
//       image: 'images/plane.svg',
//     ),
//     TourAppModel(
//       image: 'images/bus.svg',
//     ),
//     TourAppModel(
//       image: 'images/visa_card.svg',
//     ),
//   ];
//   modelDataList.assignAll(modelClass);
//   print(modelClass);
//   update();
//
// }


}*/


