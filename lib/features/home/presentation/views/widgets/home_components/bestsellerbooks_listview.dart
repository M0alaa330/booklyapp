import 'package:bookly/features/home/presentation/controller/best_saller-books_cubit/best_saller_cubit.dart';
import 'package:bookly/features/home/presentation/controller/best_saller-books_cubit/best_saller_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_components/container_booksinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestBooksListview extends StatelessWidget {
  const BestBooksListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSallerCubit, BestSallerState>(
      builder: (context, state) {
        if (state is LoadedBestSallerState) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books!.length,
              itemBuilder: (context, index) {
                return ContainerBooksInfo(bookinfo: state.books![index]);
              });
        } else if (state is ErrorBestSallerState) {
          return Text(state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
