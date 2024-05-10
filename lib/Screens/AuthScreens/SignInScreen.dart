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
import 'package:nail_art/CustomWidgets/CustomTextFieldWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthBackgroundScreenWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthCustomAppBar.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                SizedBox(height: 20.h),
                AuthCustomAppBar(),
                SizedBox(height: 20.h),
                poppinsText(
                  text: 'Log in to your Account',
                  fontSize: 40.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  controller: emailController,
                  leadingIcon: Icons.email,
                  hintText: 'Email',
                ),
                SizedBox(height: 16.h),
                CustomTextFieldWidget(
                  canObsecureText: true,
                  controller: passwordController,
                  leadingIcon: Icons.lock,
                  hintText: 'Password',
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.pushNamed(RouteName.ForgotPasswordScreen);
                      },
                      child: poppinsText(
                        text: 'Forgot the password?',
                        fontSize: 14.sp,
                        color: blackColor,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(
                          AuthLoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  child: CustomButtonWithCenterTitleWidget(title: 'Log in'),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    poppinsText(
                      text: 'Don’t have account?',
                      fontSize: 14.sp,
                      color: blackColor,
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  //TODO: add routing to this.
                  context.pushReplacementNamed(RouteName.SignUpScreen);
                },
                      child: poppinsText(
                        text: 'Sign Up',
                        fontSize: 14.sp,
                        color: primaryBrownColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 190.w,
                  height: 36.h,
                  color: whiteColor,
                  child: Center(
                    child: poppinsText(
                      text: 'or continue with',
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
