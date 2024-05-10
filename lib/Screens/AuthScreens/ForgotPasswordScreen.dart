import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:nail_art/CustomWidgets/CustomTextFieldWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthBackgroundScreenWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthCustomAppBar.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundScreenWidget(
        child: Column(
          children: [
            AuthCustomAppBar(),
            SizedBox(height: 40.h),
            poppinsText(
              text: 'Forget Password',
              fontSize: 40.sp,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: 350.w,
              child: poppinsText(
                text:
                    'No worries! Enter your email address below and we will send you a code to reset password.',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
            CustomTextFieldWidget(
              controller: emailController,
              leadingIcon: Icons.email,
              hintText: 'Email',
            ),
            SizedBox(height: 180.h),
            GestureDetector(
              onTap: () {
                //TODO: Add function here.
              },
              child: CustomButtonWithCenterTitleWidget(
                title: 'Send Reset Instruction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
