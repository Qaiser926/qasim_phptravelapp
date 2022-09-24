import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightDetailPages/flightDetailPage.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/routes/app_pages/app_pages.dart';
import 'package:phptravelapp/routes/app_routes/app_route.dart';
import 'package:http/http.dart' as http;

import '../../services/main_apiProvider.dart';

class FeatureFlight extends StatefulWidget {
  @override
  State<FeatureFlight> createState() => _FeatureFlightState();
}

class _FeatureFlightState extends State<FeatureFlight> {
  HomeController controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;
  late List flightDetailList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200, width: 0.8),
                borderRadius: BorderRadius.circular(8.0),
                // color: Colors.grey.shade200.withOpacity(0.99),

                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 0,
                    spreadRadius: 0.0,
                    offset: Offset(0, 0), // shadow direction: bottom right
                  )
                ],
              ),
              width: Get.size.width,
              height: Get.size.height * 0.15,
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const CircularProgressIndicator(),
                    ));
                  }
                  if (controller.isEmptyData.value) {
                    return Center(
                        child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text("nodatafoundText".tr),
                      ),
                    ));
                  }
                  return PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index %
                            controller.modal.value.featuredFlights!.length;
                      });
                    },
                    // itemCount:controller.modal.value.featuredFlights!.length ,
                    itemBuilder: (context, index) {
                      if (controller.isLoading.value) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: const CircularProgressIndicator(),
                        ));
                      }
                      if (controller.isEmptyData.value) {
                        return Center(
                            child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text("nodatafoundText".tr),
                          ),
                        ));
                      }
                      final item = controller.modal.value.featuredFlights;
                      // var item = index as  List<HomeOfferListModelClass>;

                      /// yaha niche data ko spit kia he first wala show nhe karna chahta our second show karo
                      String from = item![index %
                              controller.modal.value.featuredFlights!.length]
                          .from
                          .toString();
                      String fromResult =
                          from.substring(4, from.lastIndexOf(''));

                      String to = item[index %
                              controller.modal.value.featuredFlights!.length]
                          .to
                          .toString();
                      String toResult = to.substring(4, to.lastIndexOf(''));
                      // print(toResult);
                      return InkWell(
                        onTap: () async {
                          // var url = Uri.parse(
                          //     'https://phptravels.net/api/api/hotel/detail?appKey=phptravels');
                          // var mainUrl =
                          //     ('https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd');

                          // Future<String?> _getdata() async {
                          //   await http.post(url, body: {'hotel_id': 38}).then(
                          //       (response) {
                          //     var data = json.decode(response.body);
                          //     setState(() {
                          //       flightDetailList = data['featured_hotels'];
                          //     });
                          //     print(response.body);
                          //   });
                          // }

                          // var response = await http
                          //     .post(mainUrl, body: {'hotel_id': 38.toString()});
                          // print('Response status: ${response.statusCode}');
                          // print('Response body: ${response.body}');
                          Get.to(
                            FlightDetailPage(
                              from: item[index %
                                      controller
                                          .modal.value.featuredFlights!.length]
                                  .from,
                              to: item[index %
                                      controller
                                          .modal.value.featuredFlights!.length]
                                  .to,
                            ),
                          );
                          print('the index is : ${index} and');
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: PColor.mainColor,
                              width: Get.size.width * 0.4,
                              height: Get.size.height,
                              child: Image.network(
                                item[index %
                                            controller.modal.value
                                                .featuredFlights!.length]
                                        .thumbnail ??
                                    "value",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      item[index %
                                                  controller.modal.value
                                                      .featuredFlights!.length]
                                              .title ??
                                          'title not show ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    // SizedBox(
                                    //   height: 6,
                                    // ),
                                    // Text(
                                    //   '---------------',
                                    //   style: TextStyle(
                                    //       color: Colors.grey, letterSpacing: 1.7),
                                    // ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: Get.size.width * 0.45,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            // item[index %
                                            //             controller
                                            //                 .modal
                                            //                 .value
                                            //                 .featuredFlights!
                                            //                 .length]
                                            //         .from ??
                                            fromResult,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                                fontSize: 13),
                                          )),
                                          SizedBox(
                                            width: 1,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 15,
                                            color: Colors.grey.shade600,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Text(
                                            toResult,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                                fontSize: 13),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.size.height * 0.013,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: 'From'.tr,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      TextSpan(text: '    '),
                                      TextSpan(
                                          text: "USD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16.5)),
                                      TextSpan(text: '  '),
                                      TextSpan(
                                          text: item[index %
                                                  controller.modal.value
                                                      .featuredFlights!.length]
                                              .price
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.5,
                                              color: Colors.black)),
                                    ]))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );

                      /*Column(
    children: [
    Stack(
    children: [
    SizedBox(
    width: Get.size.width,
    height: Get.size.height*0.23,
    child: Image.network(item![index%controller.modal.value.featuredFlights!.length].thumbnail.toString(),),
    // child: Image.network(item![index%controller.modal.value.featuredFlights!.length].featuredFlights![index].thumbnail.toString(),),
    ),
    ],
    ),
    Padding(
    padding:  EdgeInsets.only(left: 10,right: 10,top: 10),
    child: Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Align(
    alignment:Alignment.topLeft,
    child: Text(item[index%controller.modal.value.featuredFlights!.length].title.toString(),style: TextStyle(fontWeight: FontWeight.w700),)),
    // child: Text(item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].title.toString(),style: TextStyle(fontWeight: FontWeight.w700),)),

    Text('------------------------',style: TextStyle(fontSize: 14,letterSpacing: 1.2,color: Colors.grey),),

    Row(
    children: [
    Text(item[index%controller.modal.value.featuredFlights!.length].from.toString(),style: TextStyle(),),
    // Text(item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].from.toString(),style: TextStyle(),),
    SizedBox(width: 10,),
    Icon(Icons.arrow_forward,size: 17,),
    SizedBox(width: 10,),
    Text(item[index%controller.modal.value.featuredFlights!.length].to.toString(),style: TextStyle(),),
    // Text(item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].to.toString(),style: TextStyle(),),

    ],
    ),
    SizedBox(height: 10,),
    RichText(text: TextSpan(
    children: [
    TextSpan(text: 'flightFromPrice'.tr,style: TextStyle(color: Colors.black)),
    TextSpan(text: '  '),
    TextSpan(text: 'usdtext'.tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17)),
    TextSpan(text: ' '),
    TextSpan(text: item[index%controller.modal.value.featuredFlights!.length].price.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black)),
    // TextSpan(text: item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].price.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black)),
    ]
    )),


    ],
    ),
    ),
    )
    ],
    );
*/
                    },
                  );
                },
              )),
        ),
        SizedBox(
          height: 20,
        ),
        GetBuilder<HomeController>(builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(''),
            ));
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0;
                    i < controller.modal.value.featuredFlights!.length;
                    i++)
                  biuldIndicator(currentIndex == i),
              ],
            ),
          );
        })
      ],
    );
  }

  Widget biuldIndicator(bool isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected ? 15 : 12,
        width: isSelected ? 15 : 12,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: isSelected ? 0 : 2,
                color:
                    isSelected ? Colors.grey : Colors.grey.withOpacity(0.35)),
            color:
                isSelected ? Colors.black : PColor.mainColor.withOpacity(0.1)),
      ),
    );
  }
}
