import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_art/Bloc/AuthBloC/auth_bloc.dart';
import 'package:nail_art/Core/Constants/Colors.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';
import 'package:nail_art/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:nail_art/CustomWidgets/CustomTextFieldWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthBackgroundScreenWidget.dart';
import 'package:nail_art/Screens/AuthScreens/Widgets/AuthCustomAppBar.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SignUpWithEmailScreen extends StatelessWidget {
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
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                AuthCustomAppBar(),
                poppinsText(
                  text: 'Create your Account',
                  fontSize: 46.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  controller: nameController,
                  leadingIcon: Icons.person,
                  hintText: 'Name',
                ),
                SizedBox(height: 16.h),
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
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(
                          AuthSignUpRequested(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  child: CustomButtonWithCenterTitleWidget(
                    title: 'Create Account',
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    poppinsText(
                      text: 'Do you have account?',
                      fontSize: 14.sp,
                      color: blackColor,
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        //TODO: add routing to this.
                        context.pushReplacementNamed(RouteName.SignInScreen);
                      },
                      child: poppinsText(
                        text: 'Sign In',
                        fontSize: 14.sp,
                        color: primaryBrownColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
