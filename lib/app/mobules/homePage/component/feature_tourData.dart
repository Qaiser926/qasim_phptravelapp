import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

class FeatureTourData extends StatefulWidget {
  @override
  State<FeatureTourData> createState() => _FeatureTourDataState();
}

class _FeatureTourDataState extends State<FeatureTourData> {
  final controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
                  height: Get.size.height * 0.4,
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index %
                                controller.modal.value.featuredTours!.length;
                          });
                        },
                        // itemCount:controller.modal.value.featuredFlights!.length ,
                        itemBuilder: (context, index) {
                          if (controller.isLoading.value) {
                            return Center(
                                child: const CircularProgressIndicator());
                          }
                          if (controller.isEmptyData.value) {
                            return Center(
                                child: InkWell(
                              onTap: () {},
                              child: Text("nodatafoundtext".tr),
                            ));
                          }
                          final item = controller.modal.value.featuredTours;

                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  width: Get.size.width,
                                  height: Get.size.height * 0.395,
                                  child: Image.network(
                                    item![index %
                                            controller.modal.value
                                                .featuredTours!.length]
                                        .thumbnail
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Container(
                                        width: Get.size.width * 0.24,
                                        height: Get.size.height * 0.04,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                            child: Text(
                                          controller
                                              .modal
                                              .value
                                              .featuredTours![index %
                                                  controller.modal.value
                                                      .featuredTours!.length]
                                              .location
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 25),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: RatingBarIndicator(
                                                // rating: 3.3,
                                                rating: double.parse(item[
                                                        index %
                                                            controller
                                                                .modal
                                                                .value
                                                                .featuredTours!
                                                                .length]
                                                    .avgReviews!
                                                    .totalReviews
                                                    .toString()),
                                                itemBuilder: (context, index) =>
                                                    Icon(Icons.star,
                                                        color: Colors.white),
                                                itemCount: 5,

                                                itemSize: 17.5,
                                                direction: Axis.horizontal,
                                              ),
                                            ),
                                            Text('( ',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Text(
                                              controller
                                                  .modal
                                                  .value
                                                  .featuredTours![index %
                                                      controller
                                                          .modal
                                                          .value
                                                          .featuredTours!
                                                          .length]
                                                  .avgReviews!
                                                  .overall
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(' )',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                              controller
                                                  .modal
                                                  .value
                                                  .featuredTours![index %
                                                      controller
                                                          .modal
                                                          .value
                                                          .featuredTours!
                                                          .length]
                                                  .title
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.5)),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              child: Text('Price',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text("USD",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17.5)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    controller
                                                        .modal
                                                        .value
                                                        .featuredTours![index %
                                                            controller
                                                                .modal
                                                                .value
                                                                .featuredTours!
                                                                .length]
                                                        .price
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17.5)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                        i < controller.modal.value.featuredTours!.length;
                        i++)
                      biuldIndicator(currentIndex == i)
                  ],
                ),
              );
            })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(left: 25, bottom: 35),
                width: Get.size.width * 0.12,
                height: Get.size.height * 0.12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColor.mainColor.withOpacity(0.9)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        pageController.jumpToPage(currentIndex - 1);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                )),
            Container(
                margin: EdgeInsets.only(right: 25, bottom: 35),
                width: Get.size.width * 0.12,
                height: Get.size.height * 0.12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColor.mainColor.withOpacity(0.9)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        pageController.jumpToPage(currentIndex + 1);
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                )),
          ],
        )
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
