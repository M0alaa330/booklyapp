import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:bookly/features/home/presentation/controller/allbookscubit/all_books_state.dart';
import 'package:bookly/features/home/data/repo/homerepoimple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  Homerepoimple homerepoimple;
  List<Items> loadedBooks = [];
  AllBooksCubit({required this.homerepoimple}) : super(Initialallbookssate());
  getallbooks({required int startIndex}) async {
    emit(Loadingallbookssate());
    var value = await homerepoimple.fetchAllbooks(startIndex: startIndex);
    value.fold((error) {
      emit(Errorallbooksstate(error));
    }, (books) {
      loadedBooks.addAll(books.items as Iterable<Items>);
      emit(Loadedallbookssate(books: books));
    });
  }
}
