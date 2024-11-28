import 'package:bookly/features/home/data/model/books_model.dart';

abstract class SimilarBooksState {}

class Initialsimilarbookssate extends SimilarBooksState {}

class Loadingsimilarbookssate extends SimilarBooksState {}

class Loadedsimilarbookssate extends SimilarBooksState {
  final List<Items> books;
  Loadedsimilarbookssate({required this.books});
}

class Errorsimilarbookssate extends SimilarBooksState {
  final String error;
  Errorsimilarbookssate({required this.error});
}
