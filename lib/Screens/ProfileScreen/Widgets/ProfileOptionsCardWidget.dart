import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';

class ProfileOptionsCardWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;

  const ProfileOptionsCardWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                leadingIcon,
                size: 26.sp,
              ),
              SizedBox(width: 20.w),
              poppinsText(
                text: title,
                fontSize: 17.sp,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Divider(),
        ],
      ),
    );
  }
}
