import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeView/homeView.dart';

import '../../flightPage/flightView/flightSearchPage/searchFlight.dart';
import '../../tourPage/tourView/searchPage.dart';
import '../../tourPage/tourView/tourDetailpage.dart';
import '../../visaPage/visaView/visaDetailPage.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  // const BottomNavigationBarPage({Key? key}) : super(key: key);
  int currentIndex=0;

  static  List<Widget> _widgetOptions = <Widget>[
    HomeViewPage(),

    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('travel', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
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
              BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: "bottomnav1".tr,backgroundColor: Color(0xff1EC38B),),
              BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,),label: "bottomnav2".tr,backgroundColor: Color(0xff1EC38B),),
              BottomNavigationBarItem(icon: Icon(Icons.directions_walk,color: Colors.white,),label: "bottomnav3".tr,backgroundColor: Color(0xff1EC38B),),
              BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,),label: "bottomnav4".tr,backgroundColor: Color(0xff1EC38B),),
            ],
          ),
        ),
      ),
    );
  }
}
