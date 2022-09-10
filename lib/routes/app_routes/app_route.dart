abstract class Routes {
  static const home = '/home';
  static const bottomnav = '/bottomnav';
  static const filterationpage = '/filterationpage';
  static const HotelSearchPage = '/HotelSearchPage';
  static const TourSearchPage = '/TourSearchPage';
  static const VisaSearchPage = '/VisaSearchPage';
  static const FlightDetailPag = '/FlightDetailPage';
  static const FeatureHotelDetailPage = '/FeatureHotelDetailPage';

  static String getInitial() => "$bottomnav";
  static String getFlightPageDetail(int pageId) =>
      '$FlightDetailPag?pageId=$pageId';
}

// abstract class path {
//   static const home = '/home';
//   static const bottomnav = '/bottomnav';
//   static const filterationpage = '/filterationpage';
//   static const HotelSearchPage = '/HotelSearchPage';
//   static const TourSearchPage = '/TourSearchPage';
//   static const VisaSearchPage = '/VisaSearchPage';
//   static const FlightDetailPage = '/FlightDetailPage';
// }
