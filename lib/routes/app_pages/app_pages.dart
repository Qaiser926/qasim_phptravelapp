import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightDetailPages/flightDetailPage.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeView/homeView.dart';
import 'package:phptravelapp/app/mobules/homePage/binding/homeBinding.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage.dart';
import 'package:phptravelapp/app/mobules/menu_filterPage/dataFilteration.dart';

import '../../app/mobules/flightPage/flightView/flightSearchPage/searchFlight.dart';
import '../../app/mobules/homePage/bottomNav/bottomNavigation.dart';
import '../../app/mobules/tourPage/tourView/tourDetailpage.dart';
import '../../app/mobules/visaPage/visaView/visaDetailPage.dart';
import '../app_routes/app_route.dart';

class AppPages {
  static const INITIAL = Routes.bottomnav;

  static final routes = [
    GetPage(
      name: path.bottomnav,
      page: () => BottomNavigationBarPage(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: path.home,
      page: () => HomeViewPage(),
      binding: HomeBindingPage(),
    ),
    GetPage(
      name: path.HotelSearchPage,
      page: () => HotelSearchPage(),
    ),
    GetPage(
      name: path.TourSearchPage,
      page: () => TourSearchPage(),
    ),
    GetPage(
      name: path.VisaSearchPage,
      page: () => VisaSearchPage(),
    ),
    GetPage(name: path.FlightDetailPage, page: () => FlightDetailPage()),

    // binding: HomeBindingPage(),
  ];
}
