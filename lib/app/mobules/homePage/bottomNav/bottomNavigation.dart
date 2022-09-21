import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeView/homeView.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';

import '../../flightPage/flightView/flightSearchPage/searchFlight.dart';
import '../../tourPage/tourView/searchPage.dart';
import '../../tourPage/tourView/tourDetailpage.dart';
import '../../visaPage/visaView/visaDetailPage.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  // const BottomNavigationBarPage({Key? key}) : super(key: key);
  int currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeViewPage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('travel', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      // appBar: appBar(),
      appBar: AppBar(
        surfaceTintColor: PColor.mainColor.withOpacity(0.6),
        backgroundColor: PColor.mainColor.withOpacity(0.1),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    // color: PColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      // body: AppBar(
      //   title: Text('data'),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            // backgroundColor: Color(0xff1EC38B),
            currentIndex: currentIndex,
            // onTap: (v){
            //   setState((){
            //     currentIndex=v;
            //   });
            // },
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "bottomnav1".tr,
                backgroundColor: Color(0xff1EC38B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "bottomnav2".tr,
                backgroundColor: Color(0xff1EC38B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.directions_walk,
                  color: Colors.white,
                ),
                label: "bottomnav3".tr,
                backgroundColor: Color(0xff1EC38B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: "bottomnav4".tr,
                backgroundColor: Color(0xff1EC38B),
              ),
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
                    color: PColor.mainIconColor,
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
                    color: PColor.mainIconColor,
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
          SizedBox(
            height: 10,
          ),
          ListTile(
            // leading: const Icon(Icons.currency_exchange),
            // title: DropDownPage,(),
            title: DropDownSearch(), // title: CurrencyChanger(),
            onTap: () {
              // builddialog(context);
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: const Icon(Icons.currency_exchange_outlined),
            ),
            // title: DropDownPage(),
            title: CurrencyChanger(),
            // title: LanguageChange(),
            onTap: () {
              // builddialog(context);
            },
          ),

          /*  DropdownSearch<UserModels>(
            popupProps: PopupProps.dialog(
              // fit: FlexFit.loose,
              scrollbarProps: ScrollbarProps(crossAxisMargin: 8),

              constraints: BoxConstraints(maxHeight: 200, maxWidth: 100),
            ),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              textAlign: TextAlign.right,
              dropdownSearchDecoration: InputDecoration(
                enabledBorder: InputBorder.none,
                //disabledBorder: InputBorder.none,
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Icon(
                    Icons.flag,
                  ),
                ),
                hoverColor: Colors.amber,

                labelText: 'Coutry/Region',
                helperText: 'pakistan',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),

            asyncItems: (filter) => getdata(filter),
            compareFn: (i, s) => i.isEqual(s),

            // },
            onChanged: (UserModels? data) {
              print(data);
            },
          ), */

          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: const Icon(Icons.login),
            ),
            // title: DropDownPage(),
            // title: Athentication(),
            title: AuthPage(),
            onTap: () {
              // builddialog(context);
            },
          ),

          SizedBox(
            height: 10,
          ),
          // ListTile(
          //   // leading: const Icon(Icons.login),
          //   // title: DropDownPage(),
          //   title: BottomSheetDropDown(),
          //   onTap: () {
          //     // builddialog(context);
          //   },
          // ),

          /*  Container(
            height: Get.size.height * 0.4,
            child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                // itemCount: controller.modal.value.languages!.length,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index)
                    // DataPopUp(data[index]),

                    {
                  return Card(
                    child: ExpansionTile(
                      onExpansionChanged: (v) {},
                      title: Text(
                        controller.modal.value.languages![index].name
                            .toString(),
                      ),
                      children: [
                        Container(
                          height: Get.size.height * 0.2,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            // physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller.modal.value.languages!.length,
                            itemBuilder: (context, position) {
                              return InkWell(
                                onTap: () {
                                  print('index is: ${index}');
                                },
                                child: Text(controller
                                    .modal.value.languages![position].name
                                    .toString()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
 */
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
