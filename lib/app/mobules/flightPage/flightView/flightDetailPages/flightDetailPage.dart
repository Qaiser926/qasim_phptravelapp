import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/carPage/view/carView.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightController/flightController.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightSearchPage/searchFlight.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/api_servies/api_provider.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/featureHotelDetail/featureHotelDetail.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage/hotelSearchPage.dart';
import 'package:phptravelapp/app/mobules/visaPage/visaView/visaDetailPage.dart';
import 'package:phptravelapp/app/reusableText/reusableText.dart';
import 'package:phptravelapp/app/reusableText/reusable_commonText.dart';
import 'package:http/http.dart' as http;

class FlightDetailPage extends StatefulWidget {
  String? from;
  String? to;

  final List<HomeOfferListModelClass>? posts;
  FlightDetailPage({super.key, this.from, this.to, this.posts});

  @override
  State<FlightDetailPage> createState() => _FlightDetailPageState();
}

class _FlightDetailPageState extends State<FlightDetailPage> {
  dynamic argumentData = Get.arguments;

  bool isVisible = false;
  bool isDropdownVisible = false;
  String Travellers = 'Travellers';
  String Rooms = 'Rooms';
  int childCount = 0;
  int adultCount = 2;
  int roomcout = 1;

  late HomeOfferListModelClass userModel;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiProvider.getUserData();
    // _getDataFromApi().then((value) {
    //   setState(() {
    //     data.addAll(value);
    //   });
    // });
    // getpostApi();
  }

  List<HomeOfferListModelClass> data = <HomeOfferListModelClass>[];
  // Future<List<Map<String, dynamic>>>

  // var UserModel Post;
  var a = Image.asset(
    'images/pak.png',
    width: 50,
    height: 50,
  );

  @override
  void onInit() {
    print(argumentData[1]);

    super.initState();
  }

  // final selectedValue = null;

  List listitem = ['Economy', 'Economy Premium', 'Business', 'First'];
  var valueChose = 'Economy';

  String? selectedValue;

  List<Widget> pages = [VisaSearchPage(), HotelSearchPage()];

  String isSelect = '';
  bool isSingleVisible = true;
  bool isDoubleVisible = false;
  final flightControler = Get.put(FlightController());
  final controller = Get.find<HomeController>();
  // final homecontroler = Get.find<FlightController>();
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    String from = widget.from.toString().toUpperCase();
    var pos = from.lastIndexOf(' ');
    String result = (pos != 0) ? from.substring(0, pos) : from;
    String to = widget.to.toString().toUpperCase();
    var poss = to.lastIndexOf(' ');
    String top = (poss != 1) ? to.substring(0, poss) : to;

    return Scaffold(
      backgroundColor: TColor.mainColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Container(
                  width: Get.size.width,
                  height: Get.size.height * 0.2,
                  color: TColor.flightDetailMainHeaderContaienrColor,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              result,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 13),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white70,
                              size: 15,
                            ),
                            Text(
                              top,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13),
                            ),
                          ]),
                    ),
                    const Text(
                      'Datas ( 14-09-2022 ) ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'Adults 1 Childs 0 Infants 0',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        height: Get.size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Modify Search',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                isVisible
                                    ? const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black54,
                                      )
                                    : const Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.black54,
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                      width: double.infinity,
                      height: Get.size.height * 0.6,
                      color: Colors.white,
                      child: Column(
                        children: [
                          // RadioGroup()
                          //
                          SizedBox(
                            height: 15,
                          ),
                          oneWayRadioButton(),
                          SizedBox(
                            height: 3,
                          ),
                          roundTripRadioButton(),
                          Stack(
                            children: [
                              oneWayVisiblityContainer(),
                              RoundTripVisibilityContainer()
                            ],
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: Get.size.height * 0.06,
                ),
                Container(
                  width: Get.size.width * 0.33,
                  height: Get.size.height * 0.046,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.black,
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Back To Search',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell roundTripRadioButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isDoubleVisible = !isDoubleVisible;
          isSingleVisible = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Container(
              width: Get.size.width * 0.035,
              height: Get.size.height * 0.035,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: isDoubleVisible
                    ? Border.all(
                        color: Colors.black,
                        width: 3.4,
                      )
                    : Border.all(color: Colors.grey.shade400, width: 0.9),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SmallText(
              title: 'Round Trip',
              weight: FontWeight.w600,
              size: 12.5,
            )
          ],
        ),
      ),
    );
  }

  InkWell oneWayRadioButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isSingleVisible = !isSingleVisible;
          isDoubleVisible = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Container(
              width: Get.size.width * 0.035,
              height: Get.size.height * 0.035,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: isSingleVisible
                    ? Border.all(
                        color: Colors.black,
                        width: 3.4,
                      )
                    : Border.all(color: Colors.grey.shade400, width: 0.9),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SmallText(
              title: 'One Way',
              weight: FontWeight.w600,
              size: 12.5,
            )
          ],
        ),
      ),
    );
  }

  Visibility RoundTripVisibilityContainer() {
    return Visibility(
      visible: isDoubleVisible,
      child: Container(
          width: double.infinity,
          height: Get.size.height * 0.3,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.size.height * 0.014,
                  ),
                  Container(
                    width: double.infinity,
                    height: Get.size.height * 0.04,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5),
                        border: Border.all(
                          color: Colors.grey.shade500.withOpacity(0.6),
                          width: 0.5,
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        style: TextStyle(color: Colors.transparent),
                        buttonDecoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey.shade500.withOpacity(0.6),
                          width: 0.5,
                        )),
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            'Economy',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        items: listitem
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        buttonElevation: 0,
                        dropdownElevation: 0,
                        buttonHeight: 20,
                        buttonWidth: 0,
                        dropdownMaxHeight: 200,
                        isExpanded: true,
                        itemHeight: 20,
                        dropdownDecoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade400.withOpacity(0.7),
                              width: 0.7,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: Get.size.height * 0.09,
                    child: Autocomplete<HomeOfferListModelClass>(
                      optionsBuilder: (TextEditingValue value) {
                        if (value.text.isEmpty) {
                          return List.empty();
                        }

                        // print(data);

                        // print( data.where((element) => element.name.toLowerCase().contains(value.text.toLowerCase())).toList());

                        return data
                            .where((element) => element.featuredFlights
                                .toString()
                                .toLowerCase()
                                .contains(value.text.toLowerCase()))
                            .toList();
                        // .where((element) =>
                        // element.firstName
                        //     .toLowerCase()
                        //     .contains(value.text.toLowerCase()))
                        // .toList();
                      },
                      displayStringForOption: (HomeOfferListModelClass d) =>
                          "${d.featuredFlights}, Pakistan ",
                      onSelected: (value) => print(value.featuredFlights),
                      fieldViewBuilder: (BuildContext context,
                              TextEditingController controller,
                              FocusNode node,
                              Function onSubmit) =>
                          Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: 'Select Country',
                                // prefixIcon:Image.asset('images/pak.png',width: 40,height: 40,)
                                // prefixIcon: Image.asset('images/pak.png',width: 40,height: 40,)
                              ),
                              focusNode: node,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.06,
                            // child: CircularProgressIndicator(),
                          )
                        ],
                      ),
                      optionsViewBuilder: (BuildContext context,
                          Function onSelect,
                          Iterable<HomeOfferListModelClass> datlist) {
                        return Material(
                          child: ListView.builder(
                            itemCount: datlist.length,
                            itemBuilder: (contex, index) {
                              HomeOfferListModelClass d =
                                  datlist.elementAt(index);

                              return InkWell(
                                onTap: () {
                                  onSelect(d);
                                },
                                child: ListTile(
                                  title: Text(d.featuredFlights.toString()),
                                  // leading: Image.network(d.countryCode.toString(),width: 50,height: 50,fit: BoxFit.fill,),
                                  // leading: Text(d.countryId.toString(),),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  sizebox(),
                  rangeCalender(),
                ],
              ),
            ),
          )),
    );
  }

  SizedBox sizebox() {
    return SizedBox(
      height: Get.size.height * 0.02,
    );
  }

  Widget rangeCalender() {
    return Container(
      decoration: BoxDecoration(
          // color: TColor.mainColor,
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(2)),
      child: ListTile(
        onTap: () {
          flightControler.flightChoseDate();
        },
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
        ),
        title: Row(
          children: [
            Obx(() => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('dd-MM-yyyy')
                        .format(flightControler.selectedDate())
                        .toString(),
                    style: TextStyle(
                      color: Colors.black54.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  ),
                )),
            // Obx(() => Text(" - " +
            //     DateFormat("dd-MM-yyyy")
            //         .format(homecontroler.dateRange.value.end)
            //         .toString())),
          ],
        ),
      ),
    );
  }

  Visibility oneWayVisiblityContainer() {
    return Visibility(
      visible: isSingleVisible,
      child: Container(
        width: double.infinity,
        height: Get.size.height * 0.4,
        child: Text('single'),
      ),
    );
  }
}
