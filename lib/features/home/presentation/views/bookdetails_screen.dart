import 'package:bookly/core/api/api_service.dart';
import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:bookly/features/home/data/repo/homerepoimple.dart';
import 'package:bookly/features/home/presentation/controller/similarbookscubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/bookdetails_components/body_homedetails.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookdetailsScreen extends StatelessWidget {
  const BookdetailsScreen({super.key, required this.booksinfo});

  final Items booksinfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SimilarBooksCubit(
            Homerepoimple(apiservice: ApiService(dio: Dio()))
              ..fetchasimilarbooks())
          ..getsimilarbooks(),
        child: Scaffold(
          body: Bodyhomedetails(booksinfo: booksinfo),
        ));
  }
}
