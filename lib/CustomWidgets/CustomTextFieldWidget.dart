import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  bool isFocused = false;
  bool? canObsecureText;
  final IconData leadingIcon;

  CustomTextFieldWidget({
    required this.controller,
    required this.hintText,
    required this.leadingIcon,
    this.canObsecureText,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  FocusNode? focusNode;
  bool obsecureText = true;

  void initState() {
    super.initState();
    focusNode = new FocusNode();

    // listen to focus changes
    focusNode!.addListener(() {
      setState(() {
        widget.isFocused = focusNode!.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324.w,
      height: 50.h,
      decoration: BoxDecoration(
        color:
            widget.isFocused ? lightBrownColor.withOpacity(0.28) : whiteColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.canObsecureText != null ? !obsecureText : false,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(right: 10.w),
          hintText: widget.hintText,
          hintStyle: poppinsTextStyle(
            color: widget.isFocused || widget.controller.text.isNotEmpty
                ? blackColor
                : greyColor,
          ),
          prefixIcon: Icon(
            widget.leadingIcon,
            color: widget.isFocused || widget.controller.text.isNotEmpty
                ? blackColor
                : greyColor,
            size: 18.sp,
          ),
          suffix: widget.canObsecureText != null
              ? GestureDetector(
                  onTap: () {
                    setState(() {});
                    obsecureText = !obsecureText;
                  },
                  child: Icon(
                    obsecureText
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                  ),
                )
              : SizedBox.shrink(),
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
