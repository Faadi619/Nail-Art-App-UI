import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/HomeScreen/Widgets/CarouselItemWidget.dart';
import 'package:nail_art/Screens/HomeScreen/Widgets/LatestCoursesCardWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 200.w,
                  child: poppinsText(
                    text: 'All Nail Art Courses',
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            CarouselSlider(
              options: CarouselOptions(
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                height: 290.h,
                enlargeFactor: 0.4,
                viewportFraction: 0.65,
                enlargeCenterPage: true,
              ),
              items: List.generate(
                coursesList.length,
                (index) => GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      RouteName.CourseDetailScreen,
                      pathParameters: {'index': index.toString()},
                    );
                  },
                  child: CarouselItemWidget(index: index),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  poppinsText(
                    text: 'Latest Courses',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      //TODO: Add function here.
                      context.pushNamed(RouteName.AllCoursesScreen);
                    },
                    child: poppinsText(
                      text: 'See All',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: coursesList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        //TODO: Add function here
                        context.pushNamed(
                          RouteName.CourseDetailScreen,
                          pathParameters: {'index': index.toString()},
                        );
                      },
                      child: LatestCoursesCardHomeWidget(index: index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
