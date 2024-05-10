import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:nail_art/Bloc/AuthBloC/auth_bloc.dart';
import 'package:nail_art/Bloc/BottomNavBloC/bottom_nav_bloc.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Screens/FavoritesScreen/FavoritesScreen.dart';
import 'package:nail_art/Screens/HomeScreen/HomeScreen.dart';
import 'package:nail_art/Screens/MainBottomNavigationScreen/Widgets/BottomNavBarWidget.dart';
import 'package:nail_art/Screens/MyCoursesScreen/MyCoursesScreen.dart';
import 'package:nail_art/Screens/ProfileScreen/ProfileScreen.dart';

class MainBottomNavigationScreen extends StatelessWidget {
  final List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    MyCoursesScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          //After logout route
          context.pushReplacementNamed(RouteName.SplashScreen);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavBarWidget(),
              body: screens[(state is BottomNavInitial)
                  ? 0
                  : (state as BottomNavSelectedIndex).selectedIndex],
            );
          },
        );
      },
    );
  }
}
