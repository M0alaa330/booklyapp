import 'package:bookly/core/api/api_service.dart';

import 'package:bookly/features/home/presentation/controller/allbookscubit/all_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/best_saller-books_cubit/best_saller_cubit.dart';

import 'package:bookly/features/home/data/repo/homerepoimple.dart';

import 'package:bookly/features/splash/presentation/views/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AllBooksCubit(
                  homerepoimple:
                      Homerepoimple(apiservice: ApiService(dio: Dio()))
                        ..fetchAllbooks(startIndex: 0))
                ..getallbooks(startIndex: 0)),
          BlocProvider(
              create: (context) => BestSallerCubit(
                  homerepoimple:
                      Homerepoimple(apiservice: ApiService(dio: Dio()))
                        ..fetchbestsallerbooks())
                ..getbestsallerbooks()),
        ],
        child: MaterialApp(
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: const Color(0xff100B20)),
          home: const SplashScreen(),
        ));
  }
}
