import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/MyCoursesScreen/Widgets/MyCoursesCardWidget.dart';

class MyCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    searchIcon,
                    color: Colors.transparent,
                    width: 36.w,
                    height: 36.h,
                  ),
                  Image.asset(
                    appLogo,
                    width: 34.w,
                    height: 34.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Add function here.
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
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 200.w,
                child: poppinsText(
                  text: 'My Courses',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: coursesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        RouteName.CourseDetailScreen,
                        pathParameters: {'index': index.toString()},
                      );
                    },
                    child: MyCoursesCardWidget(index: index),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
