import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';

class CustomButtonWithCenterTitleWidget extends StatelessWidget {
  final String title;
  CustomButtonWithCenterTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324.w,
      height: 49.h,
      decoration: BoxDecoration(
        color: primaryBrownColor,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: pinkShadowColor.withOpacity(0.25),
            offset: Offset(0, 10),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: poppinsText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: whiteColor,
        ),
      ),
    );
  }
}
