import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo {
  Future<Either<String, BookModel>> fetchAllbooks({required int startIndex});
  Future<Either<String, List<Items>>> fetchbestsallerbooks();
  Future fetchasimilarbooks(String category);
}
