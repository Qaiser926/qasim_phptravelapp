// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/app/mobules/homePage/component/expandedListAnimation.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/myScrollerBar.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/reusableText/commonText.dart';
import 'package:phptravelapp/app/reusableText/reusable_commonText.dart';
import 'package:phptravelapp/testingPage/testingmodel.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../component/flightdestinationData.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
// import 'package:phptravelapp/app/reusableText/reusableText.dart';
// import '../component/flightdestinationData.dart';

class HomeViewPage extends GetView<HomeController> {
  final homecontroller = Get.put(HomeController());
  Future<List<UserModels>> getdata(filter) async {
    var response = await Dio().get(
      "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;

    if (data != null) {
      return UserModels.fromJsonList(data);
    }
    return [];
  }

  String lang = 'english';
  @override
  Widget build(BuildContext context) {
    print('the height is : ${MediaQuery.of(context).size.height}');
    print('then width is : ${MediaQuery.of(context).size.width}');
    return Scaffold(
      // drawer: drawer(),

      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              // appBar(),
              // sizeBox(),
              // TabComponent(),
              // Obx(() =>Container(
              TopRowIcon(),
              SizedBox(
                height: Get.size.height * 0.013,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'topflightdestination'.tr,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 15,
              ),
              FeatureFlight(),
              SizedBox(height: Get.size.height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          shape: BoxShape.circle,
                        ),
                        width: 14,
                        height: 14,
                        child: Icon(
                          Icons.question_mark,
                          size: 8,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                      'belowFlightdestinationText'.tr,
                      style: TextStyle(fontSize: 14),
                    ))
                  ],
                ),
              ),
              SizedBox(height: Get.size.height * 0.05),
              Container(
                color: PColor.mainColor.withOpacity(0.6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: Get.size.height * 0.011,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: commonText(
                          title: 'featurehotel'.tr,
                          size: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: Get.size.height * 0.012,
                    ),
                    FeatureHotel(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 13,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'featuretour'.tr,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 12,
              ),
              FeatureTourData(),
              SizedBox(
                height: 13,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'Featured Cars',
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 13,
              ),
              FeatureCar(),
              ExpandableList(),
            ],
          ),
        ),
      ),
    );
  }
}
