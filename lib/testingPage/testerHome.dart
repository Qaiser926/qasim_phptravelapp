import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/mobules/services/controller/flightDetail_controller.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {
  final flightdetailController = Get.put(FlightDetailController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(""),
        ],
      ),
    );
  }
}
