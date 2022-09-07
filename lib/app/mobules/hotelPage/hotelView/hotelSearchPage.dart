import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelController/hotelController.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage/hotelSearchPage.dart';
import 'package:phptravelapp/app/reusableText/reusableText.dart';

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  State<HotelSearchPage> createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  dynamic argumentData = Get.arguments;

  bool isVisible = false;

  int childCount = 0;
  int adultCount = 2;
  int roomcout=1;
  String Travellers='Travellers'.tr;
  String Rooms='Rooms'.tr;
  @override
  void onInit() {
    print(argumentData[1]);

    super.initState();
  }

  final selectedValue = null;

  List listitem = ['paksitan','india','china','landon','us','canada'];
  var valueChose='paksitan';

  final homecontroler = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: commonText(title: 'City Name'.tr, size: 16)),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SearchHotel());
                  },
                  // child: ReusableEditText(title: "Search By City"),
                  child: travellerDropdownContainer(
                      'Search By City'.tr, Icons.location_on_outlined),
                ),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: commonText(title: 'Check in / Check out'.tr, size: 16),
                ),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                // calendar picker
                rangeCalender(),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: commonText(title: 'Travellers'.tr, size: 16),
                ),

                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: isVisible
                            ? travellerDropdownContainer(

                                '$Travellers ${adultCount + childCount} $Rooms ${roomcout}',
                                Icons.directions_walk)
                            : travellerDropdownContainer(

                                '$Travellers ${adultCount + childCount} $Rooms ${roomcout}',
                                Icons.directions_walk)),
                    Stack(
                      children: [
                        Container(
                    margin: EdgeInsets.only(top: 40),
                        child: SearchButton()),
                        showTravellerRemoveAddVisisbiltyContainer(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
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
        height: Get.size.height * 0.42,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
             visibilityContainerRow('Rooms'.tr,  () {
               setState(() {
                 roomcout++;
               });
             },'${roomcout}', () {
               setState(() {
                 roomcout<=0?roomcout=0:roomcout--;
                 // roomcout--;
               });
             },Icons.bedroom_child_sharp),
              visibilityContainerRow('Adults'.tr,  () {
                setState(() {
                  adultCount++;
                });
              },'${adultCount}', () {
                setState(() {
                adultCount<=0?adultCount=0:  adultCount--;
                });
              },Icons.person_outline_outlined),
              visibilityContainerRow('Childs'.tr,  () {
                setState(() {
                  childCount++;
                });
              },'${childCount}', () {
                setState(() {
                 childCount<=0?childCount=0: childCount--;

                });
              },Icons.woman),

              SizedBox(height: 4,),
              Align(
                  alignment: Alignment.topLeft,
                  child: commonText(title: 'nationality'.tr,fontWeight: FontWeight.bold,size: 18,)),
            // dropdownButton
              dropDownButton(),
            ],
          ),
        ),
      ),
    );
  }
  Widget dropDownButton(){
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      child: Container(
        width: double.infinity,
        height: Get.size.height*0.074,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: TColor.mainColor,
        ),
        child: Center(
          child: DropdownButtonFormField(

              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.wordpress_rounded,color: Colors.grey,),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(right: 6,bottom: 6),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 33.0,
                ),
              ),
              isExpanded: true,
              // style: TextStyle(color: TColor.mainblueColor),
              // underline: SizedBox(),
              // icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
              value: valueChose,
              items: listitem.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,

                );
              }).toList(),
              onChanged: (String? value){
                setState((){
                  valueChose=value!;
                });
              }),
        ),
      ),
    );
  }
Widget visibilityContainerRow(String title,Function() plusCount,String hint,Function() minusCount,IconData visibleContainerIcon){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
            child:  Row(
              children: [
                Icon(visibleContainerIcon,color: Colors.grey,),
                SizedBox(width: 5,),

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
                    color: TColor.mainColor.withOpacity(0.6),
                  ),
                  width: Get.size.width * 0.084,
                  height: Get.size.height * 0.084,
                  child: InkWell(
                      onTap: minusCount,
                      child: Center(child: InkWell(
                          child: PlusMinus(title: '-',size: 30,)))),
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
                    color: TColor.mainColor.withOpacity(0.6),
                  ),
                  width: Get.size.width * 0.084,
                  height: Get.size.height * 0.084,
                  child: Center(child: InkWell(
                      onTap: plusCount,
                      child: PlusMinus(title: '+',size: 24,)))
                )
              ],
            )),
      ],
    );
}
  Widget rangeCalender() {
    return Container(
      decoration: BoxDecoration(
          // color: TColor.mainColor,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        onTap: () {
          homecontroler.chooseDateRangePicker();
        },
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
        ),
        title: Row(
          children: [
            Obx(() => Text(DateFormat('dd-MM-yyyy')
                .format(homecontroler.dateRange.value.start)
                .toString())),
            Obx(() => Text(" - " +
                DateFormat("dd-MM-yyyy")
                    .format(homecontroler.dateRange.value.end)
                    .toString())),
          ],
        ),
      ),
    );
  }

  Widget SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.06,
      minWidth: double.infinity,
      color: TColor.mainblueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: () {},
      child: Text(
        'Search'.tr,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.5,
            letterSpacing: 1),
      ),
    );
  }

  Widget travellerDropdownContainer( String hint, IconData icon) {
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
          fillColor: TColor.mainColor,
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
