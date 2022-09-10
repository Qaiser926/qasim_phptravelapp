import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

class FeatureCar extends StatefulWidget {
  @override
  State<FeatureCar> createState() => _FeatureCarState();
}

class _FeatureCarState extends State<FeatureCar> {
  final controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200, width: 0.7),
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
                  height: Get.size.height * 0.46,
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index %
                                controller.modal.value.featuredCars!.length;
                          });
                        },
                        // itemCount:controller.modal.value.featuredFlights!.length ,
                        itemBuilder: (context, index) {
                          if (controller.isLoading.value) {
                            return Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const CircularProgressIndicator(),
                            ));
                          }
                          if (controller.isEmptyData.value) {
                            return Center(
                                child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text("nodatafoundText".tr),
                              ),
                            ));
                          }
                          final item = controller.modal.value.featuredCars;

                          return Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: Get.size.width,
                                    height: Get.size.height * 0.23,
                                    child: Image.network(
                                      item?[index %
                                                  controller.modal.value
                                                      .featuredCars!.length]
                                              .thumbnail ??
                                          "thumbnail",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            item?[index %
                                                        controller
                                                            .modal
                                                            .value
                                                            .featuredCars!
                                                            .length]
                                                    .title ??
                                                "titile",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          )),

                                      Text(
                                        item?[index %
                                                    controller.modal.value
                                                        .featuredCars!.length]
                                                .location ??
                                            "location",
                                        style: TextStyle(),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),

                                      Container(
                                        width: Get.size.width * 0.26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: TColor.mainRedColor),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.5, horizontal: 7.4),
                                          child: RatingBarIndicator(
                                            // rating: 3.3,
                                            rating: double.parse(
                                              item?[index %
                                                          controller
                                                              .modal
                                                              .value
                                                              .featuredCars!
                                                              .length]
                                                      .avgReviews!
                                                      .totalReviews ??
                                                  "total remvoew",
                                            ),
                                            itemBuilder: (context, index) =>
                                                Icon(Icons.star,
                                                    color: Colors.white),
                                            itemCount: 5,

                                            itemSize: 17.5,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      // Text("${item[index%controller.modal.value.featuredCars!.length].stars.toString()} Reviews"),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'USD',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                        TextSpan(text: '  '),
                                        TextSpan(
                                            text: item![index %
                                                    controller.modal.value
                                                        .featuredCars!.length]
                                                .price
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ])),
                                      Row(
                                        children: [
                                          Text(
                                            'featurehotelDetailText'.tr,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 12,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
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
                        i < controller.modal.value.featuredCars!.length;
                        i++)
                      biuldIndicator(currentIndex == i)
                  ],
                ),
              );
            })
          ],
        ),
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
                isSelected ? Colors.black : TColor.mainColor.withOpacity(0.1)),
      ),
    );
  }
}
