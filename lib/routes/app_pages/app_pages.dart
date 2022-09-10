import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightDetailPages/flightDetailPage.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeView/homeView.dart';
import 'package:phptravelapp/app/mobules/homePage/binding/homeBinding.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/featureHotelDetail/featureHotelDetail.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage.dart';
import 'package:phptravelapp/app/mobules/menu_filterPage/dataFilteration.dart';

import '../../app/mobules/flightPage/flightView/flightSearchPage/searchFlight.dart';
import '../../app/mobules/homePage/bottomNav/bottomNavigation.dart';
import '../../app/mobules/tourPage/tourView/tourDetailpage.dart';
import '../../app/mobules/visaPage/visaView/visaDetailPage.dart';
import '../app_routes/app_route.dart';

class AppPages {
  static const INITIAL = Routes.bottomnav;
  // static const String initial='/';

  static List<GetPage> routes = [
    GetPage(
      name: Routes.bottomnav,
      page: () => BottomNavigationBarPage(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeViewPage(),
      binding: HomeBindingPage(),
    ),
    GetPage(
      name: Routes.HotelSearchPage,
      page: () => HotelSearchPage(),
    ),
    GetPage(
      name: Routes.TourSearchPage,
      page: () => TourSearchPage(),
    ),
    GetPage(
      name: Routes.VisaSearchPage,
      page: () => VisaSearchPage(),
    ),
    GetPage(
      name: Routes.FlightDetailPag,
      page: () {
        var pageId = Get.parameters['pageId'];
        return FlightDetailPage(
            // pageId: int.parse(pageId!),
            );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FeatureHotelDetailPage,
      page: () {
        return FeatureHotelDetailPage(
            // pageId: int.parse(pageId!),
            );
      },
      transition: Transition.fadeIn,
    ),

    // binding: HomeBindingPage(),
  ];
}
