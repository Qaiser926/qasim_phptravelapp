import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/carPage/view/carView.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightController/flightController.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightDetailPages/component.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightSearchPage/searchFlight.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/services/main_apiProvider.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/featureHotelDetail/featureHotelDetail.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage/hotelSearchPage.dart';
import 'package:phptravelapp/app/mobules/visaPage/visaView/visaDetailPage.dart';
import 'package:phptravelapp/app/reusableText/commonText.dart';
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
  bool istravellerVisible = false;
  bool isCancel = false;
  bool isDropdownVisible = false;
  String Travellers = 'Travellers';
  String Rooms = 'Rooms';
  int childCount = 0;
  int adultCount = 1;
  int infants = 0;

  /// The default value is set to 200.
  late final double optionsMaxHeight = 100;
  late final double optionsMaxWidth = 100;
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
  HomeController controller = Get.find<HomeController>();
  final flightController = Get.put(FlightController());
  // final homecontroler = Get.find<FlightController>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.dispose();
    // flightController.dispose();
  }

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
      backgroundColor: PColor.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [
            Column(
              children: [
                mainHeaderContainer(result, top),
                // roundTripVisiblityContainer(
                //   context
                // ),
                mainBodyVisiblityContainer(context, from, to),

                SizedBox(
                  height: Get.size.height * 0.06,
                ),
                // backtoSearchButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Visibility mainBodyVisiblityContainer(
      BuildContext context, String from, String to) {
    return Visibility(
      visible: isVisible,
      child: Container(
          width: double.infinity,
          height: Get.size.height * 0.63,
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
                  oneWayVisiblityContainer(context, from, to),
                  // RoundTripVisibilityContainer()
                  RoundTripVisibilityContainer(context, from, to)
                  // RoundWayVisibilityContainer(
                  //   from: widget.from,
                  //   posts: [],
                  //   to: widget.to,
                  // )
                ],
              )
            ],
          )),
    );
  }

  Visibility RoundTripVisibilityContainer(
      BuildContext context, String from, String to) {
    return Visibility(
      visible: isDoubleVisible,
      child: Container(
          width: double.infinity,
          height: Get.size.height * 0.53,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.size.height * 0.014,
                  ),
                  dropdownButton(context),
                  sizebox(),
                  Stack(children: [
                    Column(children: [
                      roundWay_flighTakoff_autoCompleteTextfield(from),
                      sizebox(),
                      roundWay_flighLand_autoCompleteTextfield(to),
                    ]),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 27, top: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              spreadRadius: 0.01,

                              offset: Offset(
                                  -3, 1), // shadow direction: bottom right
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        width: Get.size.width * 0.12,
                        height: Get.size.height * 0.12,
                        child: Row(children: [
                          SizedBox(
                            width: 2.5,
                          ),
                          Icon(
                            Icons.arrow_upward,
                            size: 21,
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            size: 21,
                          ),
                        ]),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: Get.size.height * 0.015,
                  ),
                  rangeCalender(),
                  SizedBox(
                    height: Get.size.height * 0.015,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Get.size.height * 0.015,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              istravellerVisible = !istravellerVisible;
                            });
                          },
                          child: travellerDropdownContainer(
                              '${adultCount + childCount + infants}',
                              Icons.perm_identity)),
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: SearchButton()),
                          showTravellerRemoveAddVisisbiltyContainer(),
                        ],
                      )
                    ],
                  ),
                  // autoCompleteTextField(),
                ],
              ),
            ),
          )),
    );
  }

  Visibility oneWayVisiblityContainer(
      BuildContext context, String from, String to) {
    return Visibility(
      visible: isSingleVisible,
      child: Container(
          width: double.infinity,
          height: Get.size.height * 0.53,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                sizebox(),
                oneWayDropDown(context),
                sizebox(),
                Stack(
                  children: [
                    Column(
                      children: [
                        oneWay_flighTakoff_autoCompleteTextfield(from),
                        sizebox(),
                        oneWay_flighLand_autoCompleteTextfield(to),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 27, top: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              spreadRadius: 0.01,

                              offset: Offset(
                                  -3, 1), // shadow direction: bottom right
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        width: Get.size.width * 0.12,
                        height: Get.size.height * 0.12,
                        child: Row(children: [
                          SizedBox(
                            width: 2.5,
                          ),
                          Icon(
                            Icons.arrow_upward,
                            size: 21,
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            size: 21,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                // sizebox(),
                SizedBox(
                  height: Get.size.height * 0.015,
                ),
                singleCalender(),
                SizedBox(
                  height: Get.size.height * 0.015,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: Get.size.height * 0.015,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            istravellerVisible = !istravellerVisible;
                          });
                        },
                        child: oneway_travellerDropdownContainer(
                            '${adultCount + childCount + infants}',
                            Icons.perm_identity)),
                    Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: oneway_SearchButton()),
                        oneway_showTravellerRemoveAddVisisbiltyContainer(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget rangeCalender() {
    return Container(
      height: Get.size.height * 0.075,
      decoration: BoxDecoration(
          // color: PColor.mainColor,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.5)),
      child: ListTile(
        onTap: () {
          flightController.chooseDateRangePicker();
        },
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
          size: 17,
        ),
        title: Row(
          children: [
            Obx(() => Text(
                  DateFormat('dd-MM-yyyy')
                      .format(flightController.dateRange.value.start)
                      .toString(),
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                )),
            Obx(() => Text(
                " - " +
                    DateFormat("dd-MM-yyyy")
                        .format(flightController.dateRange.value.end)
                        .toString(),
                style: TextStyle(color: Colors.black54, fontSize: 13))),
          ],
        ),
      ),
    );
  }

  Container mainHeaderContainer(String result, String top) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.2,
      color: PColor.flightDetailMainHeaderContaienrColor,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  result,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white70,
                  size: 15,
                ),
                Text(
                  top,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ]),
        ),
        const Text(
          'Datas ( 14-09-2022 ) ',
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const Text(
          'Adults 1 Childs 0 Infants 0',
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
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
    );
  }

  // Container backtoSearchButton() {
  //   return Container(
  //     width: Get.size.width * 0.33,
  //     height: Get.size.height * 0.046,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(2),
  //       color: Colors.black,
  //     ),
  //     child: const Align(
  //       alignment: Alignment.center,
  //       child: Text(
  //         'Back To Search',
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
  //       ),
  //     ),
  //   );
  // }

  Container oneWayDropDown(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.size.height * 0.04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
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
                fontSize: 13,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          items: listitem
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54),
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
          itemHeight: 27,
          dropdownDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade400.withOpacity(0.7),
                width: 0.7,
              )),
        ),
      ),
    );
  }

  Container dropdownButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.size.height * 0.04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
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
                fontSize: 13,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          items: listitem
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54),
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
          itemHeight: 27,
          dropdownDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade400.withOpacity(0.7),
                width: 0.7,
              )),
        ),
      ),
    );
  }

  Widget SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.065,
      minWidth: double.infinity,
      color: Colors.black,
      // color:Color(0xff1EC38B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          SmallText(
            title: 'Serach',
            size: 15,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget oneway_SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.065,
      minWidth: double.infinity,
      color: Colors.black,
      // color:Color(0xff1EC38B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          SmallText(
            title: 'Serach',
            size: 15,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget travellerDropdownContainer(String hint, IconData icon) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        // color: color,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 18,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: SmallText(
                  title: hint,
                )),
            Text('    '),
            // Icon(
            //   Icons.keyboard_arrow_down,
            //   color: Colors.grey,
            // )
          ],
        ),
      ),
    );
  }

  Widget oneway_travellerDropdownContainer(String hint, IconData icon) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        // color: color,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 18,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: SmallText(
                  title: hint,
                )),
            Text('    '),
            // Icon(
            //   Icons.keyboard_arrow_down,
            //   color: Colors.grey,
            // )
          ],
        ),
      ),
    );
  }

  Container oneWay_flighLand_autoCompleteTextfield(String to) {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
          // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.to!
                    .toLowerCase()
                    .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode node,
                  Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix: const Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      Icons.flight_land_outlined,
                      color: Colors.black87,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.to)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: Material(
                  elevation: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dataList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      FeaturedFlight d = dataList.elementAt(index);
                      {
                        return InkWell(
                          onTap: () => onSelect(d),
                          child: Container(
                              height: Get.size.height * 0.07,
                              margin: EdgeInsets.only(right: 27),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.6, color: Colors.grey.shade200)),
                              child: Container(
                                width: Get.size.width,
                                height: Get.size.height * 0.07,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 6, right: 6),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.flight_land_outlined,
                                                    color: Colors.black54,
                                                    size: 17,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SmallText(
                                                        title: d.title,
                                                      ),
                                                      SmallText(
                                                        title: d.to,
                                                        color: Colors.black54,
                                                        size: 11,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: Get.size.width * 0.12,
                                            height: Get.size.height * 0.05,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 0.8),
                                            ),
                                            child: SmallText(
                                              title: '${d.to}',
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              )),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: to),

          // display data from api
          displayStringForOption: (
            FeaturedFlight d,
          ) {
            return "${d.title} - ${d.to}";
          }

          // to costomize fieldviewBuilder
          // fieldViewBuilder: ,
          // that method is used to call back when user click text then tap
          // onSelected: ,
          // to customize drop down in
          // optionsViewBuilder: ,
          ),
    );
  }

  Container roundWay_flighLand_autoCompleteTextfield(String to) {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
          // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.to!
                    .toLowerCase()
                    .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode node,
                  Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix: const Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      Icons.flight_land_outlined,
                      color: Colors.black87,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.to)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Container(
              decoration: BoxDecoration(),
              child: Material(
                elevation: 30,
                child: ListView.builder(
                  itemCount: dataList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    FeaturedFlight d = dataList.elementAt(index);
                    {
                      return InkWell(
                        onTap: () => onSelect(d),
                        child: Container(
                            height: Get.size.height * 0.07,
                            margin: EdgeInsets.only(right: 27),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.6, color: Colors.grey.shade200)),
                            child:
                                // ListTile(
                                //   trailing: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Container(
                                //       width: Get.size.width * 0.12,
                                //       height: Get.size.height * 0.05,
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(2),
                                //         border: Border.all(
                                //             color: Colors.grey.shade300, width: 0.8),
                                //       ),
                                //       child: SmallText(
                                //         title: '${d.from}',
                                //       ),
                                //     ),
                                //   ),
                                //   // title: SmallText(
                                //   //   title: d.title,
                                //   // ),
                                //   title: Column(
                                //     children: [
                                //       Row(children: [
                                //         const Icon(
                                //           Icons.flight_takeoff,
                                //           color: Colors.black54,
                                //         ),
                                //         SizedBox(
                                //           width: 20,
                                //         ),
                                //         SmallText(
                                //           title: d.title,
                                //         ),
                                //       ]),
                                //       Row(
                                //           crossAxisAlignment: CrossAxisAlignment.center,
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //           children: [
                                //             SmallText(
                                //               title: d.from,
                                //               size: 10,
                                //             ),
                                //             Text(' , '),
                                //             SmallText(
                                //               title: d.to,
                                //               size: 10,
                                //             ),
                                //           ]),
                                //     ],
                                //   ),
                                //   // leading: const Icon(
                                //   //   Icons.flight_takeoff,
                                //   //   color: Colors.black54,
                                //   // ),
                                //   // subtitle: Align(
                                //   //   alignment: Alignment.center,
                                //   //   child: Row(children: [
                                //   //     SmallText(
                                //   //       title: d.from,
                                //   //       size: 10,
                                //   //     ),
                                //   //     Text(' , '),
                                //   //     SmallText(
                                //   //       title: d.to,
                                //   //       size: 10,
                                //   //     ),
                                //   //   ]),
                                //   // ),
                                // ),

                                Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.07,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 6, right: 6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.flight_land_outlined,
                                                  color: Colors.black54,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      title: d.title,
                                                    ),
                                                    SmallText(
                                                      title: d.to,
                                                      color: Colors.black54,
                                                      size: 11,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.12,
                                          height: Get.size.height * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 0.8),
                                          ),
                                          child: SmallText(
                                            title: '${d.to}',
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: to),

          // display data from api
          displayStringForOption: (
            FeaturedFlight d,
          ) {
            return "${d.title} - ${d.to}";
          }

          // to costomize fieldviewBuilder
          // fieldViewBuilder: ,
          // that method is used to call back when user click text then tap
          // onSelected: ,
          // to customize drop down in
          // optionsViewBuilder: ,
          ),
    );
  }

  Container roundWay_flighTakoff_autoCompleteTextfield(String from) {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
          optionsMaxHeight: optionsMaxHeight,

          // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.from!
                    .toLowerCase()
                    .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode node,
                  Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix: const Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      Icons.flight_takeoff,
                      color: Colors.black87,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.from)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Container(
              decoration: BoxDecoration(),
              child: Material(
                elevation: 30,
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    FeaturedFlight d = dataList.elementAt(index);
                    {
                      return InkWell(
                        onTap: () => onSelect(d),
                        child: Container(
                            margin: EdgeInsets.only(right: 27),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.6, color: Colors.grey.shade200)),
                            child:
                                // ListTile(
                                //   trailing: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Container(
                                //       width: Get.size.width * 0.12,
                                //       height: Get.size.height * 0.05,
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(2),
                                //         border: Border.all(
                                //             color: Colors.grey.shade300, width: 0.8),
                                //       ),
                                //       child: SmallText(
                                //         title: '${d.from}',
                                //       ),
                                //     ),
                                //   ),
                                //   // title: SmallText(
                                //   //   title: d.title,
                                //   // ),
                                //   title: Column(
                                //     children: [
                                //       Row(children: [
                                //         const Icon(
                                //           Icons.flight_takeoff,
                                //           color: Colors.black54,
                                //         ),
                                //         SizedBox(
                                //           width: 20,
                                //         ),
                                //         SmallText(
                                //           title: d.title,
                                //         ),
                                //       ]),
                                //       Row(
                                //           crossAxisAlignment: CrossAxisAlignment.center,
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //           children: [
                                //             SmallText(
                                //               title: d.from,
                                //               size: 10,
                                //             ),
                                //             Text(' , '),
                                //             SmallText(
                                //               title: d.to,
                                //               size: 10,
                                //             ),
                                //           ]),
                                //     ],
                                //   ),
                                //   // leading: const Icon(
                                //   //   Icons.flight_takeoff,
                                //   //   color: Colors.black54,
                                //   // ),
                                //   // subtitle: Align(
                                //   //   alignment: Alignment.center,
                                //   //   child: Row(children: [
                                //   //     SmallText(
                                //   //       title: d.from,
                                //   //       size: 10,
                                //   //     ),
                                //   //     Text(' , '),
                                //   //     SmallText(
                                //   //       title: d.to,
                                //   //       size: 10,
                                //   //     ),
                                //   //   ]),
                                //   // ),
                                // ),

                                Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.07,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 6, right: 6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.flight_takeoff,
                                                  color: Colors.black54,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      title: d.title,
                                                    ),
                                                    SmallText(
                                                      title: d.from,
                                                      color: Colors.black54,
                                                      size: 11,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.12,
                                          height: Get.size.height * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 0.8),
                                          ),
                                          child: SmallText(
                                            title: '${d.from}',
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: from),

          // display data from api
          displayStringForOption: (
            FeaturedFlight d,
          ) {
            return "${d.title} - ${d.from}";
          }

          // to costomize fieldviewBuilder
          // fieldViewBuilder: ,
          // that method is used to call back when user click text then tap
          // onSelected: ,
          // to customize drop down in
          // optionsViewBuilder: ,
          ),
    );
  }

  Container oneWay_flighTakoff_autoCompleteTextfield(String from) {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
          optionsMaxHeight: optionsMaxHeight,

          // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.from!
                    .toLowerCase()
                    .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode node,
                  Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix: const Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      Icons.flight_takeoff,
                      color: Colors.black87,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.from)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Container(
              decoration: BoxDecoration(),
              child: Material(
                elevation: 30,
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    FeaturedFlight d = dataList.elementAt(index);
                    {
                      return InkWell(
                        onTap: () => onSelect(d),
                        child: Container(
                            margin: EdgeInsets.only(right: 27),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.6, color: Colors.grey.shade200)),
                            child: Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.07,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 6, right: 6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.flight_takeoff,
                                                  color: Colors.black54,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      title: d.title,
                                                    ),
                                                    SmallText(
                                                      title: d.from,
                                                      color: Colors.black54,
                                                      size: 11,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.12,
                                          height: Get.size.height * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 0.8),
                                          ),
                                          child: SmallText(
                                            title: '${d.from}',
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: from),

          // display data from api
          displayStringForOption: (
            FeaturedFlight d,
          ) {
            return "${d.title} - ${d.from}";
          }

          // to costomize fieldviewBuilder
          // fieldViewBuilder: ,
          // that method is used to call back when user click text then tap
          // onSelected: ,
          // to customize drop down in
          // optionsViewBuilder: ,
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

  SizedBox sizebox() {
    return SizedBox(
      height: Get.size.height * 0.015,
    );
  }

  Widget showTravellerRemoveAddVisisbiltyContainer() {
    return Visibility(
      visible: istravellerVisible,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 0.7),
          borderRadius: BorderRadius.circular(3.0),
          // color: Colors.grey.shade200.withOpacity(0.99),

          boxShadow: const [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 0,
              spreadRadius: 0.0,
              offset: Offset(0, 0), // shadow direction: bottom right
            )
          ],
        ),
        width: Get.size.width,
        height: Get.size.height * 0.35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              visibilityContainerRow(
                'Adults',
                () {
                  setState(() {
                    adultCount++;
                  });
                },
                '${adultCount}',
                () {
                  setState(() {
                    adultCount <= 0 ? adultCount = 0 : adultCount--;
                  });
                },
                Icons.person_outline_outlined,
                '+12',
              ),
              visibilityContainerRow(
                'Childs',
                () {
                  setState(() {
                    childCount++;
                  });
                },
                '${childCount}',
                () {
                  setState(() {
                    childCount <= 0 ? childCount = 0 : childCount--;
                  });
                },
                Icons.girl,
                '2- 11',
              ),
              visibilityContainerRow(
                'Infants',
                () {
                  setState(() {
                    infants++;
                  });
                },
                '${infants}',
                () {
                  setState(() {
                    infants <= 0 ? infants = 0 : infants--;
                  });
                },
                Icons.girl,
                '-2',
              ),

              // dropdownButton
            ],
          ),
        ),
      ),
    );
  }

  Widget oneway_showTravellerRemoveAddVisisbiltyContainer() {
    return Visibility(
      visible: istravellerVisible,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 0.7),
          borderRadius: BorderRadius.circular(3.0),
          // color: Colors.grey.shade200.withOpacity(0.99),

          boxShadow: const [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 0,
              spreadRadius: 0.0,
              offset: Offset(0, 0), // shadow direction: bottom right
            )
          ],
        ),
        width: Get.size.width,
        height: Get.size.height * 0.35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              visibilityContainerRow(
                'Adults',
                () {
                  setState(() {
                    adultCount++;
                  });
                },
                '${adultCount}',
                () {
                  setState(() {
                    adultCount <= 0 ? adultCount = 0 : adultCount--;
                  });
                },
                Icons.person_outline_outlined,
                '+12',
              ),
              visibilityContainerRow(
                'Childs',
                () {
                  setState(() {
                    childCount++;
                  });
                },
                '${childCount}',
                () {
                  setState(() {
                    childCount <= 0 ? childCount = 0 : childCount--;
                  });
                },
                Icons.girl,
                '2- 11',
              ),
              visibilityContainerRow(
                'Infants',
                () {
                  setState(() {
                    infants++;
                  });
                },
                '${infants}',
                () {
                  setState(() {
                    infants <= 0 ? infants = 0 : infants--;
                  });
                },
                Icons.girl,
                '-2',
              ),

              // dropdownButton
            ],
          ),
        ),
      ),
    );
  }

  Widget visibilityContainerRow(String title, Function() plusCount, String hint,
      Function() minusCount, IconData visibleContainerIcon, String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(
                    visibleContainerIcon,
                    color: Colors.black54,
                    size: 17,
                  ),
                  Align(
                      child: SmallText(
                    title: number,
                    color: Colors.black54,
                    size: 10,
                  ))
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              SmallText(
                title: title,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PColor.mainColor.withOpacity(0.6),
              ),
              width: Get.size.width * 0.084,
              height: Get.size.height * 0.084,
              child: InkWell(
                  onTap: minusCount,
                  child: Center(
                      child: PlusMinus(
                    title: '-',
                    size: 30,
                  ))),
            ),
            // Container(
            //     width: 35,
            //     height: 25,
            //     child: TextField(
            //       decoration: InputDecoration(
            //           hintText: '$adultCount',
            //           border: InputBorder.none),
            //     )),
            Text(hint),
            Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PColor.mainColor.withOpacity(0.6),
                ),
                width: Get.size.width * 0.084,
                height: Get.size.height * 0.084,
                child: InkWell(
                    child: Center(
                  child: InkWell(
                      onTap: plusCount,
                      child: PlusMinus(
                        title: '+',
                        size: 24,
                      )),
                )))
          ],
        )),
      ],
    );
  }

  Widget singleCalender() {
    return Container(
      height: Get.size.height * 0.076,
      decoration: BoxDecoration(
          // color: PColor.mainColor,
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(2.2)),
      child: ListTile(
        onTap: () {
          flightControler.flightChoseDate();
        },
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
          size: 17,
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
                      color: Colors.black54.withOpacity(
                        0.5,
                      ),
                      fontSize: 13,
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
}
