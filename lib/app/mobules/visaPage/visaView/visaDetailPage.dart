// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
//
// class VisaSearchPage extends StatefulWidget {
//   const VisaSearchPage({super.key});
//
//   @override
//   State<VisaSearchPage> createState() => _VisaSearchPageState();
// }
//
// class _VisaSearchPageState extends State<VisaSearchPage> {
//   dynamic argumentData = Get.arguments;
//
//   @override
//   void onInit() {
//     print(argumentData[1]);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Visa Detail page'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
//
// class TourSearchPage extends StatefulWidget {
//   const TourSearchPage({super.key});
//
//   @override
//   State<TourSearchPage> createState() => _TourSearchPageState();
// }
//
// class _TourSearchPageState extends State<TourSearchPage> {
//   dynamic argumentData = Get.arguments;
//
//   @override
//   void onInit() {
//     print(argumentData[1]);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tour Detail page'),
//
//       ),
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/reusableText/commonText.dart';

import '../visaController/visaController.dart';

class VisaSearchPage extends StatefulWidget {
  const VisaSearchPage({super.key});

  @override
  State<VisaSearchPage> createState() => _VisaSearchPageState();
}

class _VisaSearchPageState extends State<VisaSearchPage> {
  dynamic argumentData = Get.arguments;

  bool isVisible = false;

  int childCount = 0;
  int adultCount = 2;
  int roomcout = 1;
  @override
  void onInit() {
    print(argumentData[1]);

    super.initState();
  }

  final selectedValue = null;

  List listitem = ['paksitan', 'india', 'china', 'landon', 'us', 'canada'];
  var valueChose = 'paksitan';

  final homecontroler = Get.put(TourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search Visa'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: commonText(title: 'From Country'.tr, size: 16)),
              SizedBox(
                height: Get.size.height * 0.0,
              ),
              dropDownButton(),

              SizedBox(
                height: Get.size.height * 0.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: commonText(title: 'To Country'.tr, size: 16),
              ),
              SizedBox(
                height: Get.size.height * 0.0,
              ),
              // calendar picker
              dropDownButton(),
              Align(
                alignment: Alignment.topLeft,
                child: commonText(title: 'Date'.tr, size: 16),
              ),
              rangeCalender(),
              SizedBox(
                height: Get.size.height * 0.04,
              ),

              SearchButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: Get.size.height * 0.075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: Colors.grey)
            // color: PColor.mainColor,
            ),
        child: Center(
          child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.outlined_flag_outlined,
                  color: Colors.grey,
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ),
              isExpanded: true,
              // style: TextStyle(color: PColor.mainblueColor),
              // underline: SizedBox(),
              // icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
              value: valueChose,
              items: listitem.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  valueChose = value!;
                });
              }),
        ),
      ),
    );
  }

  Widget showTravellerRemoveAddVisisbiltyContainer() {
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 0.7),
          borderRadius: BorderRadius.circular(8.0),
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
        height: Get.size.height * 0.16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              visibilityContainerRow(
                  'Adults'.tr,
                  () {
                    setState(() {
                      adultCount++;
                    });
                  },
                  '${adultCount}',
                  () {
                    setState(() {
                      adultCount--;
                    });
                  },
                  Icons.person_outline_outlined),
              visibilityContainerRow(
                  'Childs'.tr,
                  () {
                    setState(() {
                      childCount++;
                    });
                  },
                  '${childCount}',
                  () {
                    setState(() {
                      childCount--;
                    });
                  },
                  Icons.woman),
            ],
          ),
        ),
      ),
    );
  }

  Widget visibilityContainerRow(String title, Function() plusCount, String hint,
      Function() minusCount, IconData visibleContainerIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Row(
          children: [
            Icon(
              visibleContainerIcon,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ],
        )),
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
              width: Get.size.width * 0.08,
              height: Get.size.height * 0.07,
              child: InkWell(onTap: minusCount, child: Icon(Icons.minimize)),
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
              width: Get.size.width * 0.08,
              height: Get.size.height * 0.07,
              child: IconButton(
                onPressed: plusCount,
                splashColor: Colors.transparent,
                icon: const Padding(
                  padding: const EdgeInsets.only(right: 27),
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        )),
      ],
    );
  }

  Widget rangeCalender() {
    return Container(
      decoration: BoxDecoration(
          // color: PColor.mainColor,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        onTap: () {
          homecontroler.chooseDatetime();
        },
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
        ),
        title: Row(
          children: [
            Obx(() => Text(DateFormat('dd-MM-yyyy')
                .format(homecontroler.selectedDate())
                .toString())),
            // Obx(() => Text(" - " +
            //     DateFormat("dd-MM-yyyy")
            //         .format(homecontroler.dateRange.value.end)
            //         .toString())),
          ],
        ),
      ),
    );
  }

  Widget SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.06,
      minWidth: double.infinity,
      color: PColor.mainblueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onPressed: () {},
      child: Text(
        'Search',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.5,
            letterSpacing: 1),
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
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    hint,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

class ReusableEditText extends StatelessWidget {
  String? title;
  // const ReusableEditText({super.key});
  ReusableEditText({this.title});
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.location_on_outlined,
            color: Colors.grey,
          ),
          fillColor: PColor.mainColor,
          filled: true,
          border: OutlineInputBorder(),
          hintText: title,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          )),
    );
  }
}
