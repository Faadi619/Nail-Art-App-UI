import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: 'Lolla Smith');
    TextEditingController emailController =
        TextEditingController(text: 'lolla_smith@example.com');
    TextEditingController passwordController =
        TextEditingController(text: '12345');
    TextEditingController confirmPasswordController =
        TextEditingController(text: '12345');
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.h),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  poppinsText(
                    text: 'Edit Profile',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Icon(
                    //Only to balance the Row.
                    Icons.arrow_back,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.h),
          EditProfileTextFieldWidget(
            leadingIcon: Icons.person,
            hintText: 'Name',
            controller: nameController,
          ),
          SizedBox(height: 30.h),
          EditProfileTextFieldWidget(
            leadingIcon: Icons.email,
            hintText: 'Email',
            controller: emailController,
          ),
          SizedBox(height: 30.h),
          //TODO: This below portion needs to be changed as it's not needed. We can
          //Make a change Password screen for it.

          EditProfileTextFieldWidget(
            leadingIcon: Icons.lock,
            hintText: 'Password',
            controller: passwordController,
            obscureText: true,
          ),
          SizedBox(height: 30.h),
          EditProfileTextFieldWidget(
            leadingIcon: Icons.lock,
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: true,
          ),
          SizedBox(height: 60.h),
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: CustomButtonWithCenterTitleWidget(title: 'Save'),
          ),
        ],
      ),
    );
  }
}

class EditProfileTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData leadingIcon;
  final bool? obscureText;

  const EditProfileTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leadingIcon,
    this.obscureText,
  });

  @override
  State<EditProfileTextFieldWidget> createState() =>
      _EditProfileTextFieldWidgetState();
}

class _EditProfileTextFieldWidgetState
    extends State<EditProfileTextFieldWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324.w,
      height: 50.h,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.obscureText != null ? !showPassword : false,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(right: 10.w),
          hintText: widget.hintText,
          prefixIcon: Icon(widget.leadingIcon),
          suffix: widget.obscureText != null
              ? GestureDetector(
                  onTap: () {
                    setState(() {});
                    showPassword = !showPassword;
                  },
                  child: Icon(
                    showPassword
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                  ),
                )
              : SizedBox(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
