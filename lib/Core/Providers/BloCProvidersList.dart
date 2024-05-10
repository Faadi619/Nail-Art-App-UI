import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nail_art/Bloc/AuthBloC/auth_bloc.dart';
import 'package:nail_art/Bloc/BottomNavBloC/bottom_nav_bloc.dart';
import 'package:nail_art/Bloc/LanguageBloc/language_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LanguageBloc>(
    create: (BuildContext context) => LanguageBloc(),
  ),
  BlocProvider<BottomNavBloc>(
    create: (BuildContext context) => BottomNavBloc(),
  ),
  BlocProvider<AuthBloc>(
    create: (BuildContext context) => AuthBloc(),
  ),
];
