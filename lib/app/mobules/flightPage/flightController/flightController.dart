import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightController extends GetxController {
  // single date picker from calender

  var selectedDate = DateTime.now().obs;
// yaha par date time get kar raha ho calender see
  flightChoseDate() async {
    DateTime? pickerDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        selectableDayPredicate: disableDate);
    if (pickerDate != null && pickerDate != selectedDate.value) {
      selectedDate.value = pickerDate;
    }
  }

  bool disableDate(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(Duration(days: 1)))
        //  && day.isBefore(DateTime.now().add(Duration(days: 5)))

        ) {
      return true;
    }
    return false;
  }

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
}
