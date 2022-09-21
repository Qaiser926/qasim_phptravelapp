import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TextFieldClass extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color? hintColor;
  final Color? iconColor;
  final bool? isfalse;

  TextFieldClass({
    required this.hintText,
    required this.icon,
    this.hintColor = Colors.grey,
    this.iconColor = Colors.black54,
    this.isfalse = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.size.height * 0.064,
      child: TextField(
        obscureText: isfalse!,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
        cursorColor: Colors.black12,
        // cursorHeight: 20,
        cursorWidth: 1.5,

        decoration: InputDecoration(
          contentPadding: (EdgeInsets.only(top: 25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          prefixIcon: Icon(
            icon,
            size: 19,
            color: iconColor,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
          )),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: hintColor,
          ),
        ),
      ),
    );
  }
}
