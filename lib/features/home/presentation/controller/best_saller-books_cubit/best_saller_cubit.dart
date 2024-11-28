import 'package:bookly/features/home/presentation/controller/best_saller-books_cubit/best_saller_state.dart';

import 'package:bookly/features/home/data/repo/homerepoimple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSallerCubit extends Cubit<BestSallerState> {
  Homerepoimple homerepoimple;
  BestSallerCubit({required this.homerepoimple})
      : super(InitialBestSallerState());
  getbestsallerbooks() async {
    emit(LoadingBestSallerState());
    var value = await homerepoimple.fetchbestsallerbooks();
    value.fold((error) {
      emit(ErrorBestSallerState(error));
    }, (books) {
      emit(LoadedBestSallerState(books: books));
    });
  }
}
