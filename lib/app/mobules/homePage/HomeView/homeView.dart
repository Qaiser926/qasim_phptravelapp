// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/app/mobules/homePage/component/expandedListAnimation.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/myScrollerBar.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/reusableText/reusableText.dart';

import '../component/flightdestinationData.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
// import 'package:phptravelapp/app/reusableText/reusableText.dart';
// import '../component/flightdestinationData.dart';

class HomeViewPage extends GetView<HomeController> {
  final homecontroller = Get.put(HomeController());

  String lng = 'English';
  final List changeCurrency = [
    {'name': 'Turkish', 'locale': Locale('en', 'turkish')},
    {'name': 'Russian', 'locale': Locale('en', 'russian')},
    {'name': 'Philippine', 'locale': Locale('en', 'flippen')},
    {'name': 'Korean', 'locale': Locale('en', 'korean')},
    {'name': 'Khmer', 'locale': Locale('en', 'khmer')},
    {'name': 'Indonesia', 'locale': Locale('en', 'indonesia')},
    {'name': 'French', 'locale': Locale('en', 'french')},
    {'name': 'Spanish', 'locale': Locale('en', 'spanish')},
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'German', 'locale': Locale('en', 'german')},
    {'name': 'Chinese', 'locale': Locale('en', 'chines')},
    {'name': 'Arabic', 'locale': Locale('en', 'arabic')},
  ];

  updateCurrency(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  List<String> _list = ['Dog', "Cat", "Mouse", 'Lion'];
  bool isStrechedDropDown = false;
  late int groupValue;
  String title = 'Select Animals';
  ChangeCurrency(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose a Currency'),
            content: Scrollbar(
              isAlwaysShown: true,
              child: Container(
                height: Get.size.height * 0.3,
                width: Get.size.width * 0.3,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            updateLanguage(locale[index]['locale']);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Center(
                                child: Row(
                              children: [
                                Container(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(countryImage[index])),
                                SizedBox(
                                  width: Get.size.width * 0.06,
                                ),
                                Text(
                                  locale[index]['name'],
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            )),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey,
                        thickness: 0.0,
                        height: 5.0,
                      );
                    },
                    itemCount: locale.length),
              ),
            ),
          );
        });
  }

  final List locale = [
    {'name': 'Turkish', 'locale': Locale('en', 'turkish')},
    {'name': 'Russian', 'locale': Locale('en', 'russian')},
    {'name': 'Philippine', 'locale': Locale('en', 'flippen')},
    {'name': 'Korean', 'locale': Locale('en', 'korean')},
    {'name': 'Khmer', 'locale': Locale('en', 'khmer')},
    {'name': 'Indonesia', 'locale': Locale('en', 'indonesia')},
    {'name': 'French', 'locale': Locale('en', 'french')},
    {'name': 'Spanish', 'locale': Locale('en', 'spanish')},
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'German', 'locale': Locale('en', 'german')},
    {'name': 'Chinese', 'locale': Locale('en', 'chines')},
    {'name': 'Arabic', 'locale': Locale('en', 'arabic')},
  ];

  List<String> countryImage = [
    'images/turkish.jpg',
    'images/rassian.jpg',
    'images/philippen.png',
    'images/korean.jpg',
    'images/Khmer.png',
    'images/indonesia.png',
    'images/french.jpg',
    'images/spanish.jpg',
    'images/us.jpg',
    'images/german.jpg',
    'images/chines.jpg',
    'images/arabic.jpg'
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose a language'),
            content: Scrollbar(
              isAlwaysShown: true,
              child: Container(
                height: Get.size.height * 0.3,
                width: Get.size.width * 0.3,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            updateLanguage(locale[index]['locale']);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Center(
                                child: Row(
                              children: [
                                Container(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(countryImage[index])),
                                SizedBox(
                                  width: Get.size.width * 0.06,
                                ),
                                Text(
                                  locale[index]['name'],
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            )),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey,
                        thickness: 0.0,
                        height: 5.0,
                      );
                    },
                    itemCount: locale.length),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        surfaceTintColor: TColor.mainColor.withOpacity(0.6),
        backgroundColor: TColor.mainColor.withOpacity(0.1),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    // color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
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
                color: TColor.mainColor.withOpacity(0.6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: commonText(
                          title: 'featurehotel'.tr,
                          size: 25,
                          fontWeight: FontWeight.bold,
                        )),
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

  Widget appBar() {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: InkWell(
                  //     onTap: () {
                  //       Get.to(DataFilteration());
                  //     },
                  //     child: Icon(Icons.menu)),
                )),
          ),
          Text(
            '       ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
    );
  }

  Widget sizeBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffe9ecef),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xffe9ecef)),
              accountName: Text(
                " ",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              accountEmail: Text(
                "Qasim Hussain",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              currentAccountPictureSize: Size.square(50),

              currentAccountPicture: CircleAvatar(
                // backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "Q",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.language),
            // title: DropDownPage(),
            title: LanguageChange(),
            onTap: () {
              // builddialog(context);
            },
          ),

          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.currency_exchange_rounded),
            title: CurrencyExchange(),
            onTap: () {
              // builddialog(context);
            },
          ),

          // ListTile(
          //   leading: Icon(Icons.person_outline_outlined),
          //   title: LoginLogoutDropDown(),
          //
          // )
          Container(
            height: Get.size.height * 0.4,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  DataPopUp(data[index]),
              itemCount: data.length,
            ),
          ),

          // ListTile(
          //   leading: const Icon(Icons.currency_exchange_rounded),
          //   title:ChangeCurreny(),
          //   // title: Text('change cuurendcy'),
          //   onTap: () {
          //
          //   },
          // ),
        ],
      ),
      //Deawer
    );
  }
}
