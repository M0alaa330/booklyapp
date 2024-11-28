import 'package:bookly/core/utlis/fonts.dart';
import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:bookly/features/home/presentation/controller/similarbookscubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/similarbookscubit/similar_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/bookdetails_components/container_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bodyhomedetails extends StatelessWidget {
  const Bodyhomedetails({
    super.key,
    required this.booksinfo,
  });
  final Items booksinfo;

  @override
  Widget build(BuildContext context) {
    final imageUrl = booksinfo.volumeInfo?.imageLinks?.thumbnail;
    final title = booksinfo.volumeInfo?.title ?? 'No Title';
    final auther = booksinfo.volumeInfo!.authors?.isNotEmpty == true
        ? booksinfo.volumeInfo!.authors![0]
        : 'Unknown';
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, right: 310),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(30)),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
              )),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 107, left: 106, bottom: 42),
          child: Image.network(
            imageUrl!,
            height: 280,
            width: 220,
          ),
        ),
        Text(
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          title,
          style: textStyle(
              color: Colors.white, fontweight: FontWeight.bold, fontsize: 20),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          auther,
          style: textStyle(
              color: Colors.white, fontweight: FontWeight.normal, fontsize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/image copy.png",
              height: 13.8,
              width: 14.37,
            ),
            const SizedBox(
              width: 6.31,
            ),
            Text(
              booksinfo.volumeInfo!.averageRating != null
                  ? booksinfo.volumeInfo!.averageRating.toString()
                  : '0',
              style: textStyle(
                  color: Colors.white,
                  fontweight: FontWeight.bold,
                  fontsize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 37,
        ),
        Container(
          height: 48,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffEF8262)),
          child: Center(
            child: Text(
              "Free Preview",
              style: textStyle(
                  color: Colors.white,
                  fontweight: FontWeight.bold,
                  fontsize: 16),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 240,
          ),
          child: Text(
            softWrap: true,
            "You can aslo like",
            style: textStyle(
                color: Colors.white, fontweight: FontWeight.bold, fontsize: 16),
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        const SizedBox(
          height: 112,
          child: Similarbookslistview(),
        )
      ],
    );
  }
}

class Similarbookslistview extends StatelessWidget {
  const Similarbookslistview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is Loadedsimilarbookssate) {
        return ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Containerbooks(
                  imageUrl:
                      state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                          '');
            });
      } else if (state is Errorsimilarbookssate) {
        return Text(state.error);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
