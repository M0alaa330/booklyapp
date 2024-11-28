import 'package:bookly/features/home/data/repo/homerepoimple.dart';
import 'package:bookly/features/home/presentation/controller/similarbookscubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final Homerepoimple homerepoimple;
  SimilarBooksCubit(this.homerepoimple) : super(Initialsimilarbookssate());
  getsimilarbooks({var category}) async {
    emit(Loadingsimilarbookssate());

    var data = await homerepoimple.fetchasimilarbooks(category);
    data.fold((error) {
      emit(Errorsimilarbookssate(error: error));
    }, (books) {
      emit(Loadedsimilarbookssate(books: books));
    });
  }
}
