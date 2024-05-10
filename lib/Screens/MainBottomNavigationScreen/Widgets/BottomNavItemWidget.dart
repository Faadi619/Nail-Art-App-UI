import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Bloc/BottomNavBloC/bottom_nav_bloc.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';

class BottomNavItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  const BottomNavItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return Container(
              width: 64.w,
              height: 34.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: state is BottomNavInitial
                    ? index == 0
                        ? whiteColor.withOpacity(0.4)
                        : Colors.transparent
                    : (state as BottomNavSelectedIndex).selectedIndex == index
                        ? whiteColor.withOpacity(0.4)
                        : Colors.transparent,
              ),
              child: Icon(
                icon,
                size: 30.sp,
                color: whiteColor,
              ),
            );
          },
        ),
        poppinsText(
          text: title,
          fontSize: 12.sp,
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
