import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Bloc/AuthBloC/auth_bloc.dart';
import 'package:nail_art/Bloc/BottomNavBloC/bottom_nav_bloc.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/Screens/ProfileScreen/Widgets/ProfileOptionsCardWidget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  appLogo,
                  width: 34.w,
                  height: 34.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.pushNamed(RouteName.EditProfileScreen);
            },
            child: ProfileOptionsCardWidget(
              leadingIcon: Icons.account_circle_outlined,
              title: 'Profile',
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: ProfileOptionsCardWidget(
              leadingIcon: Icons.share,
              title: 'Share App',
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.pushNamed(RouteName.LanguageScreen);
            },
            child: ProfileOptionsCardWidget(
              leadingIcon: Icons.language,
              title: 'Select Language',
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: 390.w,
                    height: 288.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        SizedBox(
                          width: 36.w,
                          child: Divider(color: blackColor.withOpacity(0.3)),
                        ),
                        SizedBox(height: 20.h),
                        poppinsText(
                          text: 'Logout',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10.h),
                        Divider(
                          color: blackColor,
                          indent: 30.w,
                          endIndent: 30.w,
                        ),
                        SizedBox(height: 30.h),
                        poppinsText(
                          text: 'Are you sure you to logout from the app',
                          fontSize: 15.sp,
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: Container(
                                width: 161.w,
                                height: 42.h,
                                decoration: ShapeDecoration(
                                  shape: StadiumBorder(),
                                  color: Color(0xffE6EBF2),
                                ),
                                child: Center(
                                  child: poppinsText(
                                    text: 'Cancel',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            GestureDetector(
                              onTap: () {
                                context.pop();
                                context
                                    .read<AuthBloc>()
                                    .add(AuthLogoutRequested());
                                context
                                    .read<BottomNavBloc>()
                                    .add(BottomNavReset());
                              },
                              child: Container(
                                width: 135.w,
                                height: 36.h,
                                decoration: ShapeDecoration(
                                  shape: StadiumBorder(
                                    side: BorderSide(color: lightBrownColor),
                                  ),
                                ),
                                child: Center(
                                  child: poppinsText(
                                    text: 'Yes, Logout',
                                    fontSize: 16.sp,
                                    color: lightBrownColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: ProfileOptionsCardWidget(
              leadingIcon: Icons.logout_rounded,
              title: 'Logout',
            ),
          ),
        ],
      ),
    );
  }
}
