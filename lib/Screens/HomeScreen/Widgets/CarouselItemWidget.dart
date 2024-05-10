import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/BuyCourseBottomSheetWidget.dart';

class CarouselItemWidget extends StatelessWidget {
  final int index;

  const CarouselItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 227.w,
      height: 290.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              coursesList[index].image,
              fit: BoxFit.cover,
              width: 227.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 86.w,
                      height: 20.h,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        color: primaryBrownColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: poppinsText(
                        text: '\$ ${coursesList[index].price.toString()}',
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 75.w),
                    GestureDetector(
                      onTap: () {
                        //TODO: Add function here
                      },
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 227.w,
                  height: 70.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: blackColor.withOpacity(0.25),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.r),
                      bottomRight: Radius.circular(24.r),
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      poppinsText(
                        text: coursesList[index].title,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          coursesList[index].isBought
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    //TODO: Add function here
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return BuyCourseBottomSheet(
                                            index: index);
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 70.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: primaryBrownColor,
                                    ),
                                    child: Center(
                                      child: poppinsText(
                                        text: 'BUY Now',
                                        color: whiteColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
