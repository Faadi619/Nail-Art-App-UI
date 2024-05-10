import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Core/Providers/BloCProvidersList.dart';
import 'package:nail_art/Core/Constants/Routes/GoRouter.dart';

void main() {
  runApp(
    AddiBuddy(),
  );
}

class AddiBuddy extends StatelessWidget {
  static const double _designWidth = 390;
  static const double _designHeight = 844;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(_designWidth, _designHeight),
      builder: (context, widget) => MultiBlocProvider(
        providers: blocProviders,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
