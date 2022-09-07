import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/component/top_icon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tourDetailpage.dart';
import 'package:phptravelapp/app/mobules/visaPage/visaView/visaDetailPage.dart';

import '../../flightPage/flightView/flightSearchPage/searchFlight.dart';

class TopRowIcon extends StatefulWidget {
  TopRowIcon({Key? key}) : super(key: key);

  @override
  State<TopRowIcon> createState() => _TopRowIconState();
}

class _TopRowIconState extends State<TopRowIcon> {
  late final Future<List> bannerList;
  List imagelist = [
    'https://img.freepik.com/free-vector/flat-hotel-facade-background_23-2148156669.jpg?w=740&t=st=1661617404~exp=1661618004~hmac=29016b00e89fc4935e606434b415564bf1473c801c8965877ba43025c4b7c360',
    'https://img.freepik.com/free-psd/plane-mockup_1310-1053.jpg?w=826&t=st=1661616767~exp=1661617367~hmac=423663213e6c264028466e58adf541aa1bce0e33ef25ec42f946409069512601',
    'https://img.freepik.com/free-vector/travel-by-airplane-realistic-composition_1284-25926.jpg?w=740&t=st=1661617528~exp=1661618128~hmac=4f936dbbaa08f57687fde05b2b3e942be5bdcf72b3d37f599ecef4ed3fbd253c',
    'https://img.freepik.com/free-photo/american-visa-document_1101-820.jpg?w=826&t=st=1661617638~exp=1661618238~hmac=0ed214dba9f288bbef1486d5fb1b66794db54892336bab322728dc73b0d69afa',
    'https://img.freepik.com/free-photo/american-visa-document_1101-820.jpg?w=826&t=st=1661617638~exp=1661618238~hmac=0ed214dba9f288bbef1486d5fb1b66794db54892336bab322728dc73b0d69afa'
  ];
  // List<dynamic> imagelist=['images/hotel.svg','images/aeroplane.svg','images/tour.svg','images/visa.svg'];
  List<String> image = [
        'images/hotel.svg',
        'images/aeroplane.svg',
        'images/tour.svg',
        'images/car.svg',
        'images/visa.svg'
      ] ??
      [];
  // List<String> image=[CustomImages.travelIcon,CustomImages.hotelIcon,CustomImages.aeroplaneIcon,CustomImages.discount];
  HomeController controller = Get.put(HomeController());
  // @override
  // void initState(){
  //   // bannerList = getBannerList();
  //   controller.getUserData();
  //
  // }

  @override
  Widget build(BuildContext context) {
    //
    // return  controller.isLoading.value?Center(
    //   child: CircularProgressIndicator(),
    // ):

    return GetBuilder<HomeController>(
        initState: (data) => controller.fatchProductList(),
        // dispose: controller.cleanUpTask(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const CircularProgressIndicator(),
            ));
          }
          if (controller.isEmptyData.value) {
            return Center(
                child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text("nodatafoundText".tr),
              ),
            ));
          }
          return Container(
            width: Get.size.width,
            height: Get.size.height * 0.14,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.modal.value.modules!.length,
                // itemCount: 2,
                // itemCount: imagelist.length,
                itemBuilder: (context, index) {
                  String title = 'data';
                  final itemData = controller.modal.value.modules;

                  // try{
                  //   title=itemData![index].name.toString();
                  // }catch(e){
                  //   print('error occure a giya :$e');
                  // }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () {
                            // Get.to(SearchFlightView());
                            if (index == 0) {
                              Get.to(HotelSearchPage());
                            } else if (index == 1) {
                              Get.to(FlightPage());
                            } else if (index == 2) {
                              Get.to(TourSearchPage());
                            } else if (index == 3) {
                              Get.to(VisaSearchPage());
                            } else if (index == 4) {
                              Get.to(VisaSearchPage());
                            }
                          },
                          child: Center(
                            child: Container(
                              width: Get.size.width * 0.15,
                              height: Get.size.height * 0.08,
                              decoration: BoxDecoration(
                                color: TColor.mainIconColor,
                                shape: BoxShape.circle,
                              ),
                              // child: TopIcon(
                              //   // color: colors[index],
                              //   // onTap: Get.to(ontap[index]),
                              //   image: image[index],
                              //
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(17),
                                child: Container(
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: ClipRRect(
                                      // borderRadius: BorderRadius.circular(70),
                                      child: Container(
                                          child: SvgPicture.asset(
                                        image[index],
                                      )),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),

                      Text(itemData?[index].name ?? 'value')
                      // Text(title)
                    ],
                  );
                }),
          );
        });
  }
}
