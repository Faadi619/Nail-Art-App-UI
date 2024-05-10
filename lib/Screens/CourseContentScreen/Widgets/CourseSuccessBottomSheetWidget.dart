import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';

class CourseSuccessBottomSheetWidget extends StatelessWidget {
  const CourseSuccessBottomSheetWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 514.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(splashScreenImage),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -50.h,
            child: Image.asset(
              courseSuccessfulImage,
              width: 170.w,
              height: 170.h,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Container(
                width: 243.w,
                height: 177.h,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    poppinsText(
                      text: 'Payment Successful',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    poppinsText(
                      text: '\$ ${coursesList[index].price.toString()}',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    poppinsText(
                      text: coursesList[index].title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              GestureDetector(
                onTap: () {
                  //TODO: Add function here.
                  context.pop();
                },
                child: Container(
                  width: 250.w,
                  height: 55.h,
                  decoration: ShapeDecoration(
                    color: primaryBrownColor,
                    shape: StadiumBorder(),
                  ),
                  child: Center(
                    child: poppinsText(
                      text: 'DONE',
                      fontSize: 20.sp,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
