import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/BuyCourseBottomSheetWidget.dart';

class FavoritesCoursesCardWidget extends StatelessWidget {
  final int index;

  const FavoritesCoursesCardWidget({super.key, required this.index});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: greyColor.withOpacity(0.2),
                  child: Icon(
                    coursesList[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: coursesList[index].isFavorite
                        ? primaryBrownColor
                        : blackColor,
                  ),
                ),
              ),
              coursesList[index].isBought
                  ? SizedBox()
                  : GestureDetector(
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
                        width: 80.w,
                        height: 26.h,
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
          )
        ],
      ),
    );
  }
}
