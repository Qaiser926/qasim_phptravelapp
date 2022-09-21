import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Function() onpress;
  final Color? textColor;
  AuthButton({
    required this.title,
    this.backgroundColor,
    required this.onpress,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Container(
          height: Get.size.height * 0.06,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 0.8)),
          child: MaterialButton(
            minWidth: double.infinity,
            color: backgroundColor,
            child: Text(
              title,
              style: TextStyle(color: textColor),
            ),
            onPressed: onpress,
          )),
    );
  }
}
