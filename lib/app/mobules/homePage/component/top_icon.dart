import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopIcon extends StatelessWidget {
  const TopIcon(
      {Key? key,
      required this.image,
       // this.title,
      // required this.color,
      this.onTap})
      : super(key: key);

  final String image;
  // final String? title;
  // final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration( shape: BoxShape.circle),
            padding: EdgeInsets.all(12.r),
            // margin: EdgeInsets.all(12),
            height: 48.h,
            width: 48.w,
            child: SvgPicture.asset('$image'),
          ),
          // Text(
          //   '$title',
          //   style: TextStyle(
          //     color: CustomColors.deepGray,
          //     fontSize: 14.sp,
          //     height: 1.5,
          //   ),
          // ),
        ],
      ),
    );
  }
}
