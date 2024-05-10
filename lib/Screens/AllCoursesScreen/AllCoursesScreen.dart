import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/BuyCourseBottomSheetWidget.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            SafeArea(
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
                    ),
                  ),
                  Image.asset(
                    appLogo,
                    width: 34.w,
                    height: 34.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Add function here
                      context.pushNamed(RouteName.SearchScreen);
                    },
                    child: Image.asset(
                      searchIcon,
                      width: 36.w,
                      height: 36.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            poppinsText(
              text: 'Latest Courses',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 10.h, bottom: 50.h),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: coursesList.length,
                    itemBuilder: (context, listIndex) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              RouteName.CourseDetailScreen,
                              pathParameters: {'index': listIndex.toString()},
                            );
                          },
                          child: LatestCoursesCardWidget(index: listIndex),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LatestCoursesCardWidget extends StatelessWidget {
  final int index;

  const LatestCoursesCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 216.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(carouselImage),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              //TODO: Add function here
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  coursesList[index].isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: coursesList[index].isFavorite
                      ? primaryBrownColor
                      : whiteColor,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  poppinsText(
                    text: coursesList[index].title,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  RatingBarIndicator(
                    rating: coursesList[index].courseRating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 28.sp,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              coursesList[index].isBought
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () {
                        //TODO: Add function here.
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
                            text: 'Buy Now',
                            fontSize: 11.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
