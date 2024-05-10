import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/BuyCourseBottomSheetWidget.dart';

class LatestCoursesCardHomeWidget extends StatelessWidget {
  final int index;

  const LatestCoursesCardHomeWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.w,
      height: 205.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.2),
            spreadRadius: 0.01,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 166.w,
            height: 120.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Image.asset(
                coursesList[index].image,
                height: 133.h,
                width: 166.w,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                poppinsText(
                  text: coursesList[index].title,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 5.h),
                RatingBarIndicator(
                  rating: coursesList[index].courseRating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 18.sp,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 10.h),
                coursesList[index].isBought
                    ? Container(
                        width: 65.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: greenColor,
                        ),
                        child: Center(
                          child: poppinsText(
                            text: 'Bought',
                            color: whiteColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //TODO: Add function here
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return BuyCourseBottomSheet(index: index);
                                },
                              );
                            },
                            child: Container(
                              width: 65.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: lightBrownColor,
                              ),
                              child: Center(
                                child: poppinsText(
                                  text: 'BUY Now',
                                  color: whiteColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          poppinsText(
                            text: '\$ ${coursesList[index].price}',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
