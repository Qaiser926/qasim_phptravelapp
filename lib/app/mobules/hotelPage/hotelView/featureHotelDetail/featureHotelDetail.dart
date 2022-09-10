import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

class FeatureHotelDetailPage extends StatefulWidget {
  // String? title;
  // String? des;
  // String? pic;
  String? review;
  int? discoun;
  String? location;
  String? title;
  String? des;
  String? pic;
  int? startCount;
  String? icon;
  String? name;
  FeatureHotelDetailPage({
    this.title,
    this.des,
    // this.pic,
    this.review,
    this.discoun,
    this.location,
    this.pic,
    this.startCount,
    this.icon,
    this.name,
  });

  @override
  State<FeatureHotelDetailPage> createState() => _FeatureHotelDetailPageState();
}

class _FeatureHotelDetailPageState extends State<FeatureHotelDetailPage>
    with SingleTickerProviderStateMixin {
  //  TabController tabController;

  // @override
  // void initState() {
  //   TabController tabController = new TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  HomeController controller = Get.find<HomeController>();

  bool isRead = false;
  late String firstHalf;
  late String secondHalf;
  bool flag = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.des!.length > 150) {
      firstHalf = widget.des!.substring(0, 150);
      secondHalf = widget.des!.substring(151, widget.des!.length);
    } else {
      firstHalf = widget.des.toString();
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            physics: BouncingScrollPhysics(),
            // controller: tabController,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text('Hotels Details'),
              ),
              Tab(
                child: Text('Rooms'),
              ),
              Tab(
                child: Text('Amenities'),
              ),
              Tab(
                child: Text('Policy'),
              ),
              Tab(
                child: Text('Map'),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          HotelDetailTab(),
          RoomDetailTab(),
          Amenities(),
          policy(),
          Text('map'),
        ]),
      ),
    );
  }

  Widget HotelDetailTab() {
    final maxline = 4;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 8, top: 10, bottom: 4),
                child: Text(
                  widget.title.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RatingBarIndicator(
                // rating: 3.3,
                rating: double.parse(
                  widget.review.toString(),
                ),
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: Colors.red),
                itemCount: 5,

                itemSize: 17.5,
                direction: Axis.horizontal,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.location},",
                      style: TextStyle(fontSize: 13),
                    )),
              ),
              Text(
                widget.title.toString(),
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/nnnn.png',
                width: 40,
                height: 40,
              ),
              Text(
                "${widget.discoun}%",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                ' Discount',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              width: double.infinity,
              height: Get.size.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.4,
                ),
              ),
              child: Column(children: [
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.startCount} / 5  ",
                      style: TextStyle(
                          color: TColor.textgreenColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: TColor.textgreenColor,
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Excellent Value for Money',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                widget.pic.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(
            height: Get.size.height * 0.04,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "About ${widget.title}",
                style: TextStyle(
                    color: TColor.headingTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // child: Text(
            //   widget.des.toString(),
            //   style: TextStyle(
            //     color: TColor.headingTextColor,
            //     fontSize: 13,
            //   ),
            // ),
            child: secondHalf.length == " "
                ? Text(widget.des.toString())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(flag ? firstHalf : widget.des.toString()),
                      InkWell(
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              "Show more",
                              style: TextStyle(color: Color(0xff89dad0)),
                            ),
                            Icon(
                              flag
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Color(0xff89dad0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
          ),

          // Container(
          //     child:
          //           )
        ],
      ),
    );
  }

  Widget RoomDetailTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Available Rooms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                width: Get.size.width * 0.2,
                height: 2,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.black,
                  ])),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.06,
              ),
              Container(
                width: double.infinity,
                height: Get.size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.4),
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(
                                    0.4,
                                  ),
                                  width: 1))),
                      width: double.infinity,
                      height: Get.size.height * 0.06,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Double Deluxe Rooms',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  Widget Amenities() {
    return GetBuilder<HomeController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Available Rooms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: double.infinity,
              height: Get.size.height * 0.6,
              child: GridView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: controller.modal.value.featuredHotels?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      Image.network(
                        controller.modal.value.featuredHotels![index]
                            .amenities![index].icon
                            .toString(),
                        // fit: BoxFit.cover,
                        width: Get.size.width * 0.05,
                        height: Get.size.height * 0.05,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        controller.modal.value.featuredHotels![index]
                            .amenities![index].name
                            .toString(),
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget policy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Policy',
            style: TextStyle(
                color: TColor.headingTextColor, fontWeight: FontWeight.w600),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "When booking more than 9 rooms, different policies and additional supplements may apply. All children are welcome. Free! One child under 4 years stays free of charge when using existing beds. The maximum number of extra beds/children's cots permitted in a room is 1. Cancellation and prepayment policies vary according to room type. Please enter the dates of your stay and check the conditions of your required room.",
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
