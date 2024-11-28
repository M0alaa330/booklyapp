import 'package:bookly/features/home/data/model/books_model.dart';

abstract class AllBooksState {}

class Initialallbookssate extends AllBooksState {}

class Loadingallbookssate extends AllBooksState {}

class Loadedallbookssate extends AllBooksState {
  final BookModel books;
  Loadedallbookssate({required this.books});
}

class Errorallbooksstate extends AllBooksState {
  final String error;
  Errorallbooksstate(this.error);
}
