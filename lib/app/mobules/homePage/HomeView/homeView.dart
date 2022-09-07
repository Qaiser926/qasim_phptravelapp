import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/homePage/component/HomePageComponent.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/menu_filterPage/dataFilteration.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tourDetailpage.dart';
import 'package:phptravelapp/app/mobules/visaPage/visaView/visaDetailPage.dart';
import 'package:phptravelapp/app/reusableText/reusableText.dart';

import '../component/flightdestinationData.dart';
import '../../hotelPage/hotelView/hotelSearchPage.dart';

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
              FeatureCar()
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

List currencyList = [
  'USD',
  'GBP',
  'SAR',
  'EUR',
  'pkr',
  'JPY',
  'INR',
  'CNY',
  'TRY',
  'RUB',
  'IRR',
];
bool selected = true;

class LanguageChange extends StatefulWidget {
  // const LanguageChange({Key? key}) : super(key: key);

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  List countryImage = [
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
    'images/arabic.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng = TranslationPage().getCurrentLang();
  }

  String? lng;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Text(
          'English',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: TranslationPage.langs
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: lng,
        onChanged: (value) {
          setState(() {
            this.lng = value!;
            TranslationPage().changeLocale(value);
          });
        },
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: 160,
        buttonPadding: const EdgeInsets.only(left: 5, right: 5),
        // buttonElevation: 2,
        itemHeight: 40,
        // itemPadding: const EdgeInsets.only(left: 14, right: 14),
        // dropdownMaxHeight: Get.size.height*0.3,
        // dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        // dropdownElevation: 8,
        // scrollbarRadius: const Radius.circular(10),
        // scrollbarThickness: 6,
        // scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );

    // );
    /* DropdownButton(
      menuMaxHeight: Get.size.height*0.35,

      value: this.lng,
      underline: Container(),
      isExpanded: false,
      onChanged: (newVal){
        setState((){
          this.lng=newVal!;
          TranslationPage().changeLocale(newVal);
        });
      },
      items: TranslationPage.langs.map((value) {
      // items: langs.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: [
              // Text('${txt[value]}'),
              Text(value),
            ],
          ),
        );
      }).toList(),*/
    // return  DropdownButton<String>(
    //   menuMaxHeight: Get.size.height*0.35,
    //
    //   value: this.lng,
    //   underline: Container(),
    //   isExpanded: false,
    //   onChanged: (newVal){
    //     setState((){
    //       this.lng=newVal!;
    //       TranslationPage().changeLocale(newVal);
    //     });
    //   },
    //   items: TranslationPage.langs.map(( value) {
    //     // items: langs.map((value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Row(
    //         children: [
    //           Image.asset(countryImage[2],width: 35,height: 35,),
    //           Text(value),
    //         ],
    //       ),
    //     );
    //   }).toList(),

    /*  return DropdownMenuItem(
    value: value['id'].toString(),
    child: Row(
    children: [
    Image.asset(value['image'],width: 35,height: 35,),
    // Text(value),
    Container(
    margin: EdgeInsets.only(left: 10),
    child: Text(value['name']),
    )
    ],
    ),
    );*/

    // );
  }
}

final List<DataList> data = <DataList>[
  DataList(
    'Mobiles',
    <DataList>[
      DataList('iphone'),
      DataList('vivo'),
      DataList('oppo'),
    ],
  ),
  DataList(
    'Laptops',
    <DataList>[
      DataList('Dell'),
      DataList('HP'),
    ],
  ),
  DataList(
    'name',
    <DataList>[
      DataList('qaiser'),
      DataList('ali'),
      DataList('ali'),
    ],
  ),
];

class DataList {
  DataList(this.title, [this.children = const <DataList>[]]);

  final String title;
  final List<DataList> children;
}

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);

  final DataList popup;

  Widget _buildTiles(DataList root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<DataList>(root),
      title: Text(
        root.title,
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}

class DropDownPage extends StatefulWidget {
  @override
  State<DropDownPage> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownPage> {
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
  String _selectedLang = 'en';
  bool selectedLang = false;

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        // focusColor: Colors.black,
        //   hintColor: Colors.black,
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        child: DropdownButton(
          borderRadius: BorderRadius.circular(6),
          style: TextStyle(color: Colors.orange),
          underline: Container(),
          menuMaxHeight: Get.size.height * 0.3,
          // dropdownColor: Colors.white,
          isExpanded: true,
          // focusColor: selectedLang?Colors.black:Colors.white,
          // style: TextStyle(color: Colors.black),
          value: _selectedLang,
          onChanged: (value) {
            setState(() {
              _selectedLang = value!;
              selectedLang = true;
              // TextStyle(color: Colors.black);
              // TextStyle(color:selected?Colors.black:Colors.white);
            });
            Get.updateLocale(Locale(_selectedLang));
          },
          items: [
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[0],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Turkish',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'turkish',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[1],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Rassian',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'ra',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[2],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Philippen',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'filipin',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[3],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Korean',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'korean',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[4],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Khmer',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'Khmer',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[5],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Indonesia',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'indonesia',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[6],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'French',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'french',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[7],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Spanish',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'spanish',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[8],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'English',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'en',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[9],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'German',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'german',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[10],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Chiness',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'chnes',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[11],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Arabic',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'arabic',
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  State<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  String _selectedLang = 'USD';
  bool selectedLang = false;

  List currencyList = [
    'USD',
    'GBP',
    'SAR',
    'EUR',
    'pkr',
    'JPY',
    'INR',
    'CNY',
    'TRY',
    'RUB',
    'IRR',
  ];
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          // focusColor: Colors.black,
          //   hintColor: Colors.black,
        ),
        child:
            // Scrollbar(
            //   isAlwaysShown: true,
            //   child: DropdownButton(
            //     borderRadius: BorderRadius.circular(6),
            //     style: TextStyle(color: Colors.orange),
            //     underline: Container(),
            //     menuMaxHeight: Get.size.height*0.3,
            //     // dropdownColor: Colors.white,
            //     isExpanded: true,
            //     // focusColor: selectedLang?Colors.black:Colors.white,
            //     // style: TextStyle(color: Colors.black),
            //     value: _selectedLang
            //     , onChanged: (value){
            //     setState((){
            //       _selectedLang=value!;
            //       selectedLang =true;
            //       // TextStyle(color: Colors.black);
            //       // TextStyle(color:selected?Colors.black:Colors.white);
            //     });
            //     Get.updateLocale(Locale(_selectedLang));
            //   },
            //     items: [
            //
            //       DropdownMenuItem(child: Text('USD',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'usd',),
            //       DropdownMenuItem(child: Text('GBP',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20,),),value: 'gbp',),
            //       DropdownMenuItem(child: Text('SAR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'sar',),
            //       DropdownMenuItem(child: Text('EUR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'eur',),
            //       DropdownMenuItem(child: Text('PKR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'pkr',),
            //       DropdownMenuItem(child: Text('JPY',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'jpy',),
            //       DropdownMenuItem(child: Text('INR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'inr',),
            //       DropdownMenuItem(child: Text('CNY',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),value: 'cny',),
            //       DropdownMenuItem(child: Text('TRY',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),value: 'en',),
            //       DropdownMenuItem(child: Text('RUB',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'rub',),
            //       DropdownMenuItem(child: Text('IRR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'irr',),
            //     ],
            //   ),
            // ),
            DropdownButtonHideUnderline(
          child: DropdownButton2(
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 5, right: 5),
            buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: Get.size.height * 0.3,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(10),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(0, 0),
            hint: Text(
              'USD',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: currencyList
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: _selectedLang,
            onChanged: (value) {
              setState(() {
                _selectedLang = value as String;
              });
            },
          ),
        ));
  }
}

class LoginLogoutDropDown extends StatefulWidget {
  const LoginLogoutDropDown({Key? key}) : super(key: key);

  @override
  State<LoginLogoutDropDown> createState() => _LoginLogoutDropDownState();
}

class _LoginLogoutDropDownState extends State<LoginLogoutDropDown> {
  List authenticationList = [
    'Customer Login',
    'Customer Signup',
    'Agents Login',
    'Agents Signup',
    'Supplier Login',
    'Supplier Signup',
  ];

  String? selected;

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return
        /* DropdownButtonHideUnderline(
            child: DropdownButton2(
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
              buttonHeight: 50,
              buttonWidth: 160,
              buttonPadding: const EdgeInsets.only(left: 5, right: 5),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: Get.size.height*0.3,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(10),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
              hint: Text(
                'Account',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme
                      .of(context)
                      .hintColor,
                ),
              ),
              items: authenticationList
                  .map((item) =>
                  DropdownMenuItem<String>(
                    onTap: (){
                      if(item=='Customer Login'){
                       print('customer logn');
                     Get.to(CustomerLoginPage());
                      }
                      else if(item=='Customer Signup'){
                        print('customer signup');
                        Get.to(CustomerLoginPage());
                      }else if(item=='Agents Login'){
                        print('Agents Login');
                      }else if(item=='Agents Signup'){
                        print('Agents Signup');

                      }else if(item==4){
                        print('4');
                      }else if(item==5){
                        print('5');
                      }
                    },
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                  .toList(),
              value: selected,

              onChanged: (value) {
                setState(() {
                  selected = value as String;
                });
              },

            ),

   */
        /*       Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.black,
            ),
            width: Get.size.width*0.4,
            height: Get.size.height*0.054,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person_outline_outlined,color: Colors.white,),
              Text('ACCOUNT',style: TextStyle(fontSize: 19,color: Colors.white,
              fontWeight: FontWeight.bold),),
              Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
            ],
          ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child:Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 100,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: Get.size.height*0.434,

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.size.height*0.01,),
                     commonText('Customer Login',() => CustomerLoginPage()),
                      SizedBox(height: Get.size.height*0.03,),
                     commonText('Customer Signup',() => CustomerSignupPage()),
                      SizedBox(height: Get.size.height*0.03,),
                     Divider(color: Colors.white54),
                     commonText('Agents Login',() => AgentLoginPage()),
                      SizedBox(height: Get.size.height*0.03,),
                     commonText('Agents Signup',()=>AgentSignupPage()),
                      SizedBox(height: Get.size.height*0.02,),
                      Divider(color: Colors.white54),
                     commonText('Supplier Signup',()=>SupplierSignupPage()),
                      SizedBox(height: Get.size.height*0.03,),
                     commonText('Supplier Login',()=>SupplierLoginPage()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )*/
        /*

    );
*/
        ListView.builder(
      itemBuilder: (BuildContext context, int index) => DataPopUp(data[index]),
      itemCount: data.length,
    );
  }

  Widget commonText(String title, Function() onpress) {
    return InkWell(
      onTap: () {
        Get.to(onpress);
      },
      child: Text(
        title,
        style: TextStyle(
            fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
