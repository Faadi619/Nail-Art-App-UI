import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Constants/Assets.dart';

class AuthBackgroundScreenWidget extends StatelessWidget {
  final Widget child;

  const AuthBackgroundScreenWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(splashScreenImage),
        ),
      ),
      child: child,
    );
  }
}
