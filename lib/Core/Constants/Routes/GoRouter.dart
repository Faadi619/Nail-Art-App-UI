import 'package:go_router/go_router.dart';
import 'package:nail_art/Core/Constants/Routes/RouteNames.dart';
import 'package:nail_art/Screens/AllCoursesScreen/AllCoursesScreen.dart';
import 'package:nail_art/Screens/AuthScreens/ForgotPasswordScreen.dart';
import 'package:nail_art/Screens/AuthScreens/SignInScreen.dart';
import 'package:nail_art/Screens/AuthScreens/SignUpScreen.dart';
import 'package:nail_art/Screens/AuthScreens/SignUpWithEmailScreen.dart';
import 'package:nail_art/Screens/CourseContentScreen/CourseContentScreen.dart';
import 'package:nail_art/Screens/CourseDetailScreen/CourseDetailScreen.dart';
import 'package:nail_art/Screens/EditProfileScreen/EditProfileScreen.dart';
import 'package:nail_art/Screens/ErrorPage.dart';
import 'package:nail_art/Screens/LanguageScreen.dart';
import 'package:nail_art/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:nail_art/Screens/SearchScreen/SearchScreen.dart';
import 'package:nail_art/SplashScreen.dart';

final GoRouter router = GoRouter(
  //TODO: Use the below function for redirection to handle consistancy login.

  // redirect: (context, state) {
  //   if (isLoggedIn) {
  //     return '/language';
  //   } else {
  //     return '/HomeScreen';
  //   }
  // },

  errorBuilder: (context, state) =>
      ErrorPage(), //TODO: Use this for error handling.

  routes: [
    GoRoute(
      name: RouteName.SplashScreen,
      path: '/',
      builder: ((context, state) => SplashScreen()),
    ),
    GoRoute(
      name: RouteName.LanguageScreen,
      path: '/language',
      builder: ((context, state) => LanguageScreen()),
    ),
    GoRoute(
      name: RouteName.SignInScreen,
      path: '/signInScreen',
      builder: ((context, state) => SignInScreen()),
    ),
    GoRoute(
      name: RouteName.SignUpScreen,
      path: '/signUpScreen',
      builder: ((context, state) => SignUpScreen()),
    ),
    GoRoute(
      name: RouteName.SignUpWithEmailScreen,
      path: '/signUpWithEmailScreen',
      builder: ((context, state) => SignUpWithEmailScreen()),
    ),
    GoRoute(
      name: RouteName.ForgotPasswordScreen,
      path: '/forgotPasswordScreen',
      builder: ((context, state) => ForgotPasswordScreen()),
    ),
    GoRoute(
      name: RouteName.MainBottomNavigationScreen,
      path: '/mainBottomNavigationScreen',
      builder: ((context, state) => MainBottomNavigationScreen()),
    ),
    GoRoute(
      name: RouteName.CourseDetailScreen,
      path: '/courseDetailScreen/:index',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['index'] ?? '0');

        // Given that `id` is now an integer, you can proceed safely
        return CourseDetailScreen(index: id);
      },
    ),
    GoRoute(
      name: RouteName.CourseContentScreen,
      path: '/courseContentScreen/:index',
      builder: ((context, state) {
        final id = int.parse(state.pathParameters['index'] ?? '0');

        // Given that `id` is now an integer, you can proceed safely
        return CourseContentScreen(index: id);
      }),
    ),
    GoRoute(
      name: RouteName.AllCoursesScreen,
      path: '/allCoursesScreen',
      builder: ((context, state) => AllCoursesScreen()),
    ),
    GoRoute(
      name: RouteName.SearchScreen,
      path: '/searchScreen',
      builder: ((context, state) => SearchScreen()),
    ),
    GoRoute(
      name: RouteName.EditProfileScreen,
      path: '/editProfileScreen',
      builder: ((context, state) => EditProfileScreen()),
    ),
  ],
);
