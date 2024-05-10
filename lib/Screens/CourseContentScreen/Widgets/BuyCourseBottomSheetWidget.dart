import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Model/CourseDataModel.dart';
import 'package:nail_art/Screens/CourseContentScreen/Widgets/CourseSuccessBottomSheetWidget.dart';

class BuyCourseBottomSheet extends StatelessWidget {
  const BuyCourseBottomSheet({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 514.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(splashScreenImage),
        ),
      ),
      child: Column(
        children: [
          poppinsText(
            text: '\$ ${coursesList[index].price.toString()}',
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10.h),
          Container(
            width: 292.w,
            height: 280.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(carouselImage),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 292.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: blackColor.withOpacity(0.25),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.r),
                      bottomRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Center(
                    child: poppinsText(
                      text: coursesList[index].title,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              //TODO: Add function here.
              context.pop();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CourseSuccessBottomSheetWidget(index: index);
                },
              );
            },
            child: Container(
              width: 250.w,
              height: 55.h,
              decoration: ShapeDecoration(
                color: primaryBrownColor,
                shape: StadiumBorder(),
              ),
              child: Center(
                child: poppinsText(
                  text: 'Confirm',
                  fontSize: 20.sp,
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
