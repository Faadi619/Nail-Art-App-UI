import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';

class MyCoursesCardWidget extends StatelessWidget {
  final int index;

  const MyCoursesCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(11.r),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 85.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  carouselImage,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170.w,
                child: poppinsText(
                  text: coursesList[index].title,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              RatingBarIndicator(
                rating: coursesList[index].courseRating,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 24.sp,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
