import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Bloc/AuthBloC/auth_bloc.dart';
import 'package:nail_art/Bloc/LanguageBloc/language_bloc.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/Strings.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                globeIcon,
                width: 103.w,
                height: 103.h,
              ),
              SizedBox(height: 30.h),
              poppinsText(
                text: 'Select Language',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final language = languages[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(language),
                              trailing: Radio(
                                activeColor: lightBrownColor,
                                value: language,
                                groupValue: state is LanguageInitial
                                    ? 'English'
                                    : (state as LangaugeSelected)
                                        .selectedLanguage,
                                onChanged: (value) {
                                  context.read<LanguageBloc>().add(
                                        SelectLanguage(
                                          selectedLanguage: value.toString(),
                                        ),
                                      );
                                },
                              ),
                              leading: Image.asset(
                                flags[index],
                                width: 26.w,
                                height: 18.h,
                              ),
                            ),
                            Divider(color: Color(0xffB9B9B9)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      //TODO: Add function here.

                      state is AuthSuccess
                          ? context.pop()
                          : context.pushNamed(RouteName.SignInScreen);
                    },
                    child: CustomButtonWithCenterTitleWidget(
                      title: state is AuthSuccess ? 'Save' : 'Next',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
