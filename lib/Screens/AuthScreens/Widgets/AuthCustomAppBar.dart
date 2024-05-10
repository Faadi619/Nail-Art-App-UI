import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';

class AuthCustomAppBar extends StatelessWidget {
  const AuthCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 24.sp,
                color: blackColor,
              ),
            ),
            Image.asset(
              appLogo,
              width: 40.w,
            ),
            Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
