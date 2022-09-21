import 'package:flutter/material.dart';
import 'package:phptravelapp/app/colors.dart';

class commonText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final double? size;
  final Color? Textcolor;

  commonText(
      {required this.title,
      this.fontWeight,
      this.size = 14,
      this.Textcolor = const Color(0xff0D233E)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style:
            TextStyle(fontWeight: fontWeight, fontSize: size, color: Textcolor),
      ),
    );
  }
}

class PlusMinus extends StatelessWidget {
  String? title;
  double? size;
  PlusMinus({this.title, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(fontSize: size),
    );
  }
}
