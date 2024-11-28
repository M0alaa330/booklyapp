import 'package:bookly/core/api/api_service.dart';
import 'package:bookly/core/faliure/faliure.dart';
import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:bookly/features/home/data/repo/homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Homerepoimple implements Homerepo {
  ApiService apiservice;
  Homerepoimple({required this.apiservice});
  @override
  Future<Either<String, BookModel>> fetchAllbooks(
      {required int startIndex}) async {
    try {
      Map<String, dynamic> data = await apiservice.get(
          endpoints:
              "v1/volumes?Filtering=free-ebooks&q=allbooks0&startIndex=$startIndex");
      //   List<Items> allbooks = [];
      //   for (var i in data["items"]) {
      //     allbooks.add(Items.fromJson(i));
      //   }
      //   return right(allbooks);
      // } catch (e) {
      //   return left(e.toString());
      // }
      BookModel bookModel = BookModel.fromJson(data);
      return right(bookModel);
    } catch (e) {
      if (e is DioException) {
        return left(FaluierServer.fromDioError(e) as String);
      }
      return left(FaluierServer(e.toString()) as String);
    }
  }

  @override
  Future<Either<String, List<Items>>> fetchbestsallerbooks() async {
    try {
      Map<String, dynamic> data = await apiservice.get(
          endpoints:
              "v1/volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=newest");
      List<Items> allbooks = [];
      for (var i in data["items"]) {
        allbooks.add(Items.fromJson(i));
      }
      return right(allbooks);
    } catch (e) {
      if (e is DioException) {
        return left(FaluierServer.fromDioError(e) as String);
      }
      return left(FaluierServer(e.toString()) as String);
    }
  }

  @override
  Future<Either<String, List<Items>>> fetchasimilarbooks() async {
    try {
      var data = await apiservice.get(
          endpoints:
              "v1/volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=newest");
      List<Items> allbooks = [];
      for (var i in data["items"]) {
        allbooks.add(Items.fromJson(i));
      }
      return right(allbooks);
    } catch (e) {
      return left(e.toString());
    }
  }
}
