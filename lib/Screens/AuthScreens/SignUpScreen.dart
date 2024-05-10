import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Bloc/AuthBloC/auth_bloc.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthBackgroundScreenWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthCustomAppBar.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundScreenWidget(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
            if (state is AuthSuccess) {
              context.goNamed(RouteName.MainBottomNavigationScreen);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                AuthCustomAppBar(),
                SizedBox(height: 50.h),
                poppinsText(
                  text: 'Let’s get Started',
                  fontSize: 40.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 120.h),
                GestureDetector(
                  onTap: () {
                    //TODO: Add function here
                    context.read<AuthBloc>().add(
                          AuthLoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  child: Image.asset(
                    facebookSigninButtonImage,
                    width: 324.w,
                    height: 41.h,
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    //TODO: Add function here
                    context.read<AuthBloc>().add(
                          AuthLoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  child: Image.asset(
                    googleSigninButtonImage,
                    width: 324.w,
                    height: 41.h,
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    //TODO: Add function here
                    context.read<AuthBloc>().add(
                          AuthLoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  child: Image.asset(
                    appleSigninButtonImage,
                    width: 324.w,
                    height: 41.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 96.w,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: whiteColor,
                    shape: StadiumBorder(),
                  ),
                  child: Center(
                    child: poppinsText(
                      text: 'or',
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    context
                        .pushReplacementNamed(RouteName.SignUpWithEmailScreen);
                  },
                  child: CustomButtonWithCenterTitleWidget(
                    title: 'Continue with Email',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
