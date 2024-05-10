import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';

TextEditingController searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.h),
          SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(width: 10.w),
                SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: TextField(
                    controller: searchController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search Here',
                      alignLabelWithHint: true,
                      prefixIcon: Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.only(right: 5.w, left: 5.w),
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: primaryBrownColor,
                          ),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: primaryBrownColor,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 30.h),
              itemCount: coursesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        RouteName.CourseDetailScreen,
                        pathParameters: {'index': index.toString()},
                      );
                    },
                    child: AllCoursesItemWidget(index: index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AllCoursesItemWidget extends StatelessWidget {
  final int index;

  const AllCoursesItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90.h,
          color: Colors.transparent,
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
                        image: AssetImage(carouselImage),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                            : whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  poppinsText(
                    text: '\$ ${coursesList[index].price.toString()}',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: greyColor.withOpacity(0.6)),
      ],
    );
  }
}
