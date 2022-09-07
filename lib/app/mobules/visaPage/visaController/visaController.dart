import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourController extends GetxController{


  // single date picker from calender

  var selectedDate = DateTime.now().obs;
// yaha par date time get kar raha ho calender see
  chooseDatetime() async {
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

}