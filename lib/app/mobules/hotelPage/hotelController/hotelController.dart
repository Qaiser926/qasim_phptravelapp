
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelController extends GetxController{



  // yaha par b data time pick kar with range in calender
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
  ).obs;



  @override
  void onClose() {}

  chooseDateRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
        context: Get.context!,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20),
        cancelText: 'Close',
        confirmText: 'Confirm',

        /// yaha par theme change kare ge
        builder: ((context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        }),
        initialDateRange: dateRange.value);
    if (picked != null && picked != dateRange.value) {
      dateRange.value = picked;
    }
  }
  @override
  void onReady() {
    super.onReady();
  }
}