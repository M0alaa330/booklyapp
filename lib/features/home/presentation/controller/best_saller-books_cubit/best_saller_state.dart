import 'package:bookly/features/home/data/model/books_model.dart';

abstract class BestSallerState {}

class InitialBestSallerState extends BestSallerState {}

class LoadingBestSallerState extends BestSallerState {}

class LoadedBestSallerState extends BestSallerState {
  final List<Items>? books;
  LoadedBestSallerState({required this.books});
}

class ErrorBestSallerState extends BestSallerState {
  final String error;
  ErrorBestSallerState(this.error);
}
