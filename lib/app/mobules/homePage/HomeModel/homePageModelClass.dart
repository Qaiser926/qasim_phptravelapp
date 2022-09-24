// To parse this JSON data, do
//
//     final homeOfferListModelClass = homeOfferListModelClassFromJson(jsonString);

import 'dart:convert';

HomeOfferListModelClass homeOfferListModelClassFromJson(String str) =>
    HomeOfferListModelClass.fromJson(json.decode(str));

String homeOfferListModelClassToJson(HomeOfferListModelClass data) =>
    json.encode(data.toJson());

class HomeOfferListModelClass {
  HomeOfferListModelClass({
    this.modules,
    this.slider,
    this.paymentGateways,
    this.extras,
    this.currencies,
    this.languages,
    this.cms,
    this.app,
    this.social,
    this.featuredHotels,
    this.featuredFlights,
    this.featuredTours,
    this.featuredCars,
    this.featuredBlog,
  });

  late List<Module>? modules;
  late List<Slider>? slider;
  late List<PaymentGateway>? paymentGateways;
  late List<Extra>? extras;
  late List<Currency>? currencies;
  late List<Language>? languages;
  Cms? cms;
  App? app;
  late List<Social>? social;
  late List<Featured>? featuredHotels;
  late List<FeaturedFlight>? featuredFlights;
  late List<Featured>? featuredTours;
  late List<FeaturedCar>? featuredCars;
  late List<FeaturedBlog>? featuredBlog;

  factory HomeOfferListModelClass.fromJson(Map<String, dynamic> json) =>
      HomeOfferListModelClass(
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        slider:
            List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
        paymentGateways: List<PaymentGateway>.from(
            json["payment_gateways"].map((x) => PaymentGateway.fromJson(x))),
        extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        cms: Cms.fromJson(json["cms"]),
        app: App.fromJson(json["app"]),
        social:
            List<Social>.from(json["social"].map((x) => Social.fromJson(x))),
        featuredHotels: List<Featured>.from(
            json["featured_hotels"].map((x) => Featured.fromJson(x))),
        featuredFlights: List<FeaturedFlight>.from(
            json["featured_flights"].map((x) => FeaturedFlight.fromJson(x))),
        featuredTours: List<Featured>.from(
            json["featured_tours"].map((x) => Featured.fromJson(x))),
        featuredCars: List<FeaturedCar>.from(
            json["featured_cars"].map((x) => FeaturedCar.fromJson(x))),
        featuredBlog: List<FeaturedBlog>.from(
            json["featured_blog"].map((x) => FeaturedBlog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "modules": List<dynamic>.from(modules!.map((x) => x.toJson())),
        "slider": List<dynamic>.from(slider!.map((x) => x.toJson())),
        "payment_gateways":
            List<dynamic>.from(paymentGateways!.map((x) => x.toJson())),
        "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
        "currencies": List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
        "cms": cms!.toJson(),
        "app": app!.toJson(),
        "social": List<dynamic>.from(social!.map((x) => x.toJson())),
        "featured_hotels":
            List<dynamic>.from(featuredHotels!.map((x) => x.toJson())),
        "featured_flights":
            List<dynamic>.from(featuredFlights!.map((x) => x.toJson())),
        "featured_tours":
            List<dynamic>.from(featuredTours!.map((x) => x.toJson())),
        "featured_cars":
            List<dynamic>.from(featuredCars!.map((x) => x.toJson())),
        "featured_blog":
            List<dynamic>.from(featuredBlog!.map((x) => x.toJson())),
      };
}

class App {
  App({
    this.appname,
    this.siteUrl,
    this.offline,
    this.offlineMsg,
    this.restrictWebsite,
    this.allowRegistration,
    this.allowAgentRegistration,
    this.suppliersRegistration,
    this.gmapKey,
    this.defaultValueLanguage,
    this.multiCurrency,
    this.multiLanguage,
    this.currencyCode,
    this.copyright,
    this.email,
    this.phone,
    this.address,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
  });

  String? appname;
  String? siteUrl;
  String? offline;
  String? offlineMsg;
  bool? restrictWebsite;
  bool? allowRegistration;
  bool? allowAgentRegistration;
  bool? suppliersRegistration;
  String? gmapKey;
  String? defaultValueLanguage;
  bool? multiCurrency;
  bool? multiLanguage;
  String? currencyCode;
  String? copyright;
  String? email;
  String? phone;
  String? address;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;

  factory App.fromJson(Map<String, dynamic> json) => App(
        appname: json["appname"],
        siteUrl: json["site_url"],
        offline: json["offline"],
        offlineMsg: json["offline_msg"],
        restrictWebsite: json["restrict_website"],
        allowRegistration: json["allow_registration"],
        allowAgentRegistration: json["allow_agent_registration"],
        suppliersRegistration: json["suppliers_registration"],
        gmapKey: json["gmap_key"],
        defaultValueLanguage: json["defaultValue_language"],
        multiCurrency: json["multi_currency"],
        multiLanguage: json["multi_language"],
        currencyCode: json["currency_code"],
        copyright: json["copyright"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        metaTitle: json["meta_title"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
      );

  Map<String, dynamic> toJson() => {
        "appname": appname,
        "site_url": siteUrl,
        "offline": offline,
        "offline_msg": offlineMsg,
        "restrict_website": restrictWebsite,
        "allow_registration": allowRegistration,
        "allow_agent_registration": allowAgentRegistration,
        "suppliers_registration": suppliersRegistration,
        "gmap_key": gmapKey,
        "defaultValue_language": defaultValueLanguage,
        "multi_currency": multiCurrency,
        "multi_language": multiLanguage,
        "currency_code": currencyCode,
        "copyright": copyright,
        "email": email,
        "phone": phone,
        "address": address,
        "meta_title": metaTitle,
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
      };
}

class Cms {
  Cms({
    this.header,
    this.footer,
  });

  List<Header>? header;
  List<Footer>? footer;

  factory Cms.fromJson(Map<String, dynamic> json) => Cms(
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        footer:
            List<Footer>.from(json["footer"].map((x) => Footer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": List<dynamic>.from(header!.map((x) => x.toJson())),
        "footer": List<dynamic>.from(footer!.map((x) => x.toJson())),
      };
}

class Footer {
  Footer({
    this.company,
    this.support,
    this.services,
  });

  List<Company>? company;
  List<Company>? support;
  List<Company>? services;

  factory Footer.fromJson(Map<String, dynamic> json) => Footer(
        company: json["Company"] == null
            ? null
            : List<Company>.from(
                json["Company"].map((x) => Company.fromJson(x))),
        support: json["Support"] == null
            ? null
            : List<Company>.from(
                json["Support"].map((x) => Company.fromJson(x))),
        services: json["Services"] == null
            ? null
            : List<Company>.from(
                json["Services"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Company": company == null
            ? null
            : List<dynamic>.from(company!.map((x) => x.toJson())),
        "Support": support == null
            ? null
            : List<dynamic>.from(support!.map((x) => x.toJson())),
        "Services": services == null
            ? null
            : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Company {
  Company({
    this.href,
    this.target,
    this.title,
  });

  String? href;
  dynamic target;
  String? title;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        href: json["href"],
        target: json["target"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "target": target,
        "title": title,
      };
}

class Header {
  Header({
    this.company,
  });

  List<Company>? company;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        company:
            List<Company>.from(json["Company"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Company": List<dynamic>.from(company!.map((x) => x.toJson())),
      };
}

class Currency {
  Currency({
    this.id,
    this.name,
    this.symbol,
    this.code,
    this.rate,
    this.decimals,
    this.symbolPlacement,
    this.primaryOrder,
    this.currencyDefault,
    this.status,
  });

  int? id;
  String? name;
  String? symbol;
  String? code;
  String? rate;
  String? decimals;
  SymbolPlacement? symbolPlacement;
  String? primaryOrder;
  bool? currencyDefault;
  bool? status;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        code: json["code"],
        rate: json["rate"],
        decimals: json["decimals"],
        symbolPlacement: symbolPlacementValues.map![json["symbol_placement"]],
        primaryOrder: json["primary_order"],
        currencyDefault: json["defaultValue"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol == null ? null : symbol,
        "code": code,
        "rate": rate,
        "decimals": decimals,
        "symbol_placement": symbolPlacementValues.reverse[symbolPlacement],
        "primary_order": primaryOrder,
        "defaultValue": currencyDefault,
        "status": status,
      };
}

enum SymbolPlacement { BEFORE }

final symbolPlacementValues = EnumValues({"before": SymbolPlacement.BEFORE});

class Extra {
  Extra({
    this.title,
    this.status,
  });

  String? title;
  bool? status;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        title: json["title"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "status": status,
      };
}

class FeaturedBlog {
  FeaturedBlog({
    this.id,
    this.title,
    this.thumbnail,
    this.desc,
    this.shortDesc,
    this.slug,
  });

  String? id;
  String? title;
  String? thumbnail;
  String? desc;
  String? shortDesc;
  String? slug;

  factory FeaturedBlog.fromJson(Map<String, dynamic> json) => FeaturedBlog(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        desc: json["desc"],
        shortDesc: json["shortDesc"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "desc": desc,
        "shortDesc": shortDesc,
        "slug": slug,
      };
}

class FeaturedCar {
  FeaturedCar({
    this.id,
    this.title,
    this.slug,
    this.thumbnail,
    this.stars,
    this.starsCount,
    this.location,
    this.desc,
    this.doors,
    this.passengers,
    this.transmission,
    this.airportPickup,
    this.baggage,
    this.price,
    this.currCode,
    this.carType,
    this.discount,
    this.latitude,
    this.longitude,
    this.avgReviews,
  });

  String? id;
  String? title;
  String? slug;
  String? thumbnail;
  String? stars;
  String? starsCount;
  String? location;
  String? desc;
  String? doors;
  String? passengers;
  String? transmission;
  String? airportPickup;
  String? baggage;
  int? price;
  CurrCode? currCode;
  String? carType;
  String? discount;
  String? latitude;
  String? longitude;
  AvgReviews? avgReviews;

  factory FeaturedCar.fromJson(Map<String, dynamic> json) => FeaturedCar(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        thumbnail: json["thumbnail"],
        stars: json["stars"],
        starsCount: json["starsCount"],
        location: json["location"],
        desc: json["desc"],
        doors: json["doors"],
        passengers: json["passengers"],
        transmission: json["transmission"],
        airportPickup: json["airportPickup"],
        baggage: json["baggage"],
        price: json["price"],
        currCode: currCodeValues.map![json["currCode"]],
        carType: json["carType"],
        discount: json["discount"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        avgReviews: AvgReviews.fromJson(json["avgReviews"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "thumbnail": thumbnail,
        "stars": stars,
        "starsCount": starsCount,
        "location": location,
        "desc": desc,
        "doors": doors,
        "passengers": passengers,
        "transmission": transmission,
        "airportPickup": airportPickup,
        "baggage": baggage,
        "price": price,
        "currCode": currCodeValues.reverse[currCode],
        "carType": carType,
        "discount": discount,
        "latitude": latitude,
        "longitude": longitude,
        "avgReviews": avgReviews?.toJson(),
      };
}

class AvgReviews {
  AvgReviews({
    this.clean,
    this.comfort,
    this.location,
    this.facilities,
    this.staff,
    this.totalReviews,
    this.overall,
  });

  double? clean;
  double? comfort;
  double? location;
  double? facilities;
  double? staff;
  String? totalReviews;
  double? overall;

  factory AvgReviews.fromJson(Map<String, dynamic> json) => AvgReviews(
        clean: json["clean"].toDouble(),
        comfort: json["comfort"].toDouble(),
        location: json["location"].toDouble(),
        facilities: json["facilities"].toDouble(),
        staff: json["staff"].toDouble(),
        totalReviews: json["totalReviews"].toString(),
        overall: json["overall"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "clean": clean,
        "comfort": comfort,
        "location": location,
        "facilities": facilities,
        "staff": staff,
        "totalReviews": totalReviews,
        "overall": overall,
      };
}

enum CurrCode { USD }

final currCodeValues = EnumValues({"usd": CurrCode.USD});

class FeaturedFlight {
  FeaturedFlight({
    this.id,
    this.title,
    this.from,
    this.to,
    this.thumbnail,
    this.desc,
    this.price,
    this.currCode,
  });

  String? id;
  String? title;
  String? from;
  String? to;
  String? thumbnail;
  String? desc;
  int? price;
  CurrCode? currCode;

  factory FeaturedFlight.fromJson(Map<String, dynamic> json) => FeaturedFlight(
        id: json["id"],
        title: json["title"],
        from: json["from"],
        to: json["to"],
        thumbnail: json["thumbnail"],
        desc: json["desc"],
        price: json["price"],
        currCode: currCodeValues.map![json["currCode"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "from": from,
        "to": to,
        "thumbnail": thumbnail,
        "desc": desc,
        "price": price,
        "currCode": currCodeValues.reverse[currCode],
      };
}

class Featured {
  Featured({
    this.id,
    this.title,
    this.slug,
    this.thumbnail,
    this.stars,
    this.starsCount,
    this.location,
    this.desc,
    this.amenities,
    this.avgReviews,
    this.latitude,
    this.longitude,
    this.discount,
    this.address,
    this.price,
    this.currCode,
    this.inclusions,
    this.tourDays,
    this.tourNights,
    this.tourType,
  });

  String? id;
  String? title;
  String? slug;
  String? thumbnail;
  String? stars;
  String? starsCount;
  String? location;
  String? desc;
  List<Amenity>? amenities;
  AvgReviews? avgReviews;
  String? latitude;
  String? longitude;
  String? discount;
  // int? discount;
  String? address;
  int? price;
  dynamic? currCode;
  dynamic? inclusions;
  String? tourDays;
  String? tourNights;
  String? tourType;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        thumbnail: json["thumbnail"],
        stars: json["stars"],
        starsCount: json["starsCount"],
        location: json["location"],
        desc: json["desc"],
        amenities: json["amenities"] == null
            ? null
            : List<Amenity>.from(
                json["amenities"].map((x) => Amenity.fromJson(x))),
        avgReviews: AvgReviews.fromJson(json["avgReviews"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        discount: json["discount"],
        address: json["address"] == null ? null : json["address"],
        price: json["price"],
        currCode: currCodeValues.map![json["currCode"]],
        inclusions: json["inclusions"],
        tourDays: json["tourDays"] == null ? null : json["tourDays"],
        tourNights: json["tourNights"] == null ? null : json["tourNights"],
        tourType: json["tourType"] == null ? null : json["tourType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "thumbnail": thumbnail,
        "stars": stars,
        "starsCount": starsCount,
        "location": location,
        "desc": desc,
        "amenities": amenities == null
            ? null
            : List<dynamic>.from(amenities!.map((x) => x.toJson())),
        "avgReviews": avgReviews!.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "discount": discount,
        "address": address == null ? null : address,
        "price": price,
        "currCode": currCodeValues.reverse[currCode],
        "inclusions": inclusions,
        "tourDays": tourDays == null ? null : tourDays,
        "tourNights": tourNights == null ? null : tourNights,
        "tourType": tourType == null ? null : tourType,
      };
}

class Amenity {
  Amenity({
    this.icon,
    this.name,
  });

  String? icon;
  String? name;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        icon: json["icon"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
      };
}

class Language {
  Language({
    this.id,
    this.name,
    this.rtl,
    this.country,
    this.languageDefault,
  });

  int? id;
  String? name;
  String? rtl;
  String? country;
  bool? languageDefault;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
        rtl: json["rtl"],
        country: json["country"],
        languageDefault: json["defaultValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rtl": rtl,
        "country": country,
        "defaultValue": languageDefault,
      };
}

class Module {
  Module({
    this.name,
    this.status,
    this.order,
  });

  var name;
  bool? status;
  String? order;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        name: json["name"],
        status: json["status??"],
        order: json["order"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "order": order,
      };
}

class PaymentGateway {
  PaymentGateway({
    this.title,
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.c5,
    this.dev,
    this.devEndpoint,
    this.proEndpoint,
    this.order,
  });

  String? title;
  String? c1;
  String? c2;
  String? c3;
  String? c4;
  String? c5;
  bool? dev;
  String? devEndpoint;
  String? proEndpoint;
  String? order;

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        title: json["title"],
        c1: json["c1"] == null ? null : json["c1"],
        c2: json["c2"] == null ? null : json["c2"],
        c3: json["c3"] == null ? null : json["c3"],
        c4: json["c4"] == null ? null : json["c4"],
        c5: json["c5"] == null ? null : json["c5"],
        dev: json["dev"],
        devEndpoint: json["dev_endpoint"] == null ? null : json["dev_endpoint"],
        proEndpoint: json["pro_endpoint"] == null ? null : json["pro_endpoint"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "c1": c1 == null ? null : c1,
        "c2": c2 == null ? null : c2,
        "c3": c3 == null ? null : c3,
        "c4": c4 == null ? null : c4,
        "c5": c5 == null ? null : c5,
        "dev": dev,
        "dev_endpoint": devEndpoint == null ? null : devEndpoint,
        "pro_endpoint": proEndpoint == null ? null : proEndpoint,
        "order": order,
      };
}

class Slider {
  Slider({
    this.slideId,
    this.slidePosition,
    this.slideTitleText,
    this.slideDescText,
    this.slideOptionalText,
    this.slideLink,
    this.slideLinkName,
    this.slideImage,
    this.slideStatus,
    this.slideOrder,
  });

  String? slideId;
  String? slidePosition;
  dynamic slideTitleText;
  dynamic slideDescText;
  dynamic slideOptionalText;
  dynamic slideLink;
  dynamic slideLinkName;
  String? slideImage;
  String? slideStatus;
  String? slideOrder;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        slideId: json["slide_id"],
        slidePosition: json["slide_position"],
        slideTitleText: json["slide_title_text"],
        slideDescText: json["slide_desc_text"],
        slideOptionalText: json["slide_optional_text"],
        slideLink: json["slide_link"],
        slideLinkName: json["slide_link_name"],
        slideImage: json["slide_image"],
        slideStatus: json["slide_status"],
        slideOrder: json["slide_order"],
      );

  Map<String, dynamic> toJson() => {
        "slide_id": slideId,
        "slide_position": slidePosition,
        "slide_title_text": slideTitleText,
        "slide_desc_text": slideDescText,
        "slide_optional_text": slideOptionalText,
        "slide_link": slideLink,
        "slide_link_name": slideLinkName,
        "slide_image": slideImage,
        "slide_status": slideStatus,
        "slide_order": slideOrder,
      };
}

class Social {
  Social({
    this.socialId,
    this.socialName,
    this.socialLink,
    this.socialPosition,
    this.socialOrder,
    this.status,
    this.socialIcon,
  });

  String? socialId;
  String? socialName;
  String? socialLink;
  String? socialPosition;
  String? socialOrder;
  bool? status;
  String? socialIcon;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        socialId: json["social_id"],
        socialName: json["social_name"],
        socialLink: json["social_link"],
        socialPosition: json["social_position"],
        socialOrder: json["social_order"],
        status: json["status"],
        socialIcon: json["social_icon"],
      );

  Map<String, dynamic> toJson() => {
        "social_id": socialId,
        "social_name": socialName,
        "social_link": socialLink,
        "social_position": socialPosition,
        "social_order": socialOrder,
        "status": status,
        "social_icon": socialIcon,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
