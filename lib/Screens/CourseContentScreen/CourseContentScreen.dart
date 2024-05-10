import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/BuyCourseBottomSheetWidget.dart';

class CourseContentScreen extends StatelessWidget {
  final int index;

  const CourseContentScreen({super.key, required this.index});

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
                child: Column(
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
                    SizedBox(height: 10.h),
                    Icon(
                      Icons.play_circle_outline,
                      size: 120.sp,
                      color: primaryBrownColor,
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 10.h),
              shrinkWrap: true,
              itemCount: coursesList[index].courseVideos.length,
              itemBuilder: (context, listIndex) {
                return CourseVideoCardWidget(
                  index: index,
                  listIndex: listIndex,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CourseVideoCardWidget extends StatelessWidget {
  const CourseVideoCardWidget({
    super.key,
    required this.index,
    required this.listIndex,
  });

  final int index;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 70.h,
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundColor: blackColor.withOpacity(0.15),
            child: poppinsText(
              text: (listIndex + 1).toString(),
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 64.w,
            height: 57.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(carouselImage),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.lock,
                color: whiteColor,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              poppinsText(
                text: coursesList[index].courseVideos[listIndex].title,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              Container(
                width: 260.w,
                child: poppinsText(
                  text: coursesList[index].courseVideos[listIndex].description,
                  fontSize: 10.sp,
                  maxLines: 3,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
