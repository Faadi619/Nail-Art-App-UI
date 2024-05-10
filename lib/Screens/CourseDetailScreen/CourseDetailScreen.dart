import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/BuyCourseBottomSheetWidget.dart';

class CourseDetailScreen extends StatelessWidget {
  final int index;

  const CourseDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Show this only when the course is not already bought.
      bottomSheet: coursesList[index].isBought
          ? SizedBox()
          : Container(
              width: 1.sw,
              height: 90.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(bottomNavImage),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        poppinsText(
                          text: 'Course Price',
                          fontSize: 13.sp,
                          color: whiteColor,
                        ),
                        poppinsText(
                          text: '\$ ${coursesList[index].price}',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
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
                        width: 135.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: whiteColor),
                        ),
                        child: Center(
                          child: poppinsText(
                            text: 'Buy Now',
                            fontSize: 16.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 250.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(carouselImage),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.play_circle_outline,
                      size: 120.sp,
                      color: primaryBrownColor,
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 120.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: primaryBrownColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: poppinsText(
                            text: 'Price: \$ ${coursesList[index].price}',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 344.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.2),
                    offset: Offset(3, 3),
                    spreadRadius: 0.01,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Image.asset(
                      carouselImage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      poppinsText(
                        text: 'Stephen N',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: coursesList[index].courseRating / 5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 1,
                            itemSize: 24.sp,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(width: 5.w),
                          poppinsText(
                            text:
                                '${coursesList[index].courseRating} (${coursesList[index].numberofRatings} reviews)',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              width: 344.w,
              height: 73.h,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.1),
                    spreadRadius: 0.01,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        instagramShareIcon,
                        width: 40.w,
                        height: 40.h,
                      ),
                      SizedBox(height: 5.h),
                      poppinsText(
                        text: 'Instagram',
                        fontSize: 12.sp,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        facebookShareIcon,
                        width: 40.w,
                        height: 40.h,
                      ),
                      SizedBox(height: 5.h),
                      poppinsText(
                        text: 'Facebook',
                        fontSize: 12.sp,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //TODO: Add function here
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: lightBrownColor.withOpacity(0.18),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              color: primaryBrownColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      poppinsText(
                        text: 'Favorite',
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h),
            GestureDetector(
              onTap: () {
                //TODO: Add function here
                context.pushNamed(
                  RouteName.CourseContentScreen,
                  pathParameters: {'index': index.toString()},
                );
              },
              child: Container(
                width: 338.w,
                height: 155.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(carouselImage),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 338.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: lightBrownColor.withOpacity(0.72),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.playlist_play,
                            size: 24.sp,
                            color: whiteColor,
                          ),
                          SizedBox(width: 10.w),
                          poppinsText(
                            text: '4 Videos',
                            fontSize: 16.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  poppinsText(
                    text: 'Ratings',
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: coursesList[index].ratingsTextList.length,
                    itemBuilder: (context, listIndex) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          poppinsText(
                            text: coursesList[index].ratingsTextList[listIndex],
                            fontSize: 15.sp,
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
