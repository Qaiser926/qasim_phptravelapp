
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabComponent extends StatefulWidget {

  @override
  State<TabComponent> createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent> {
  @override
  Widget build(BuildContext context) {
    return  TabBar(
      physics: BouncingScrollPhysics(),
      isScrollable: true,
      indicatorWeight: 0,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      tabs: [
        Text(
          'tabindex1'.tr,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'tabindex2'.tr,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'tabindex3'.tr,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'tabindex4'.tr,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
