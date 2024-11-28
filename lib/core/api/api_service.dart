import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String _baseurl = "https://www.googleapis.com/books/";

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String endpoints}) async {
    var response = await dio.get("$_baseurl$endpoints");
    return response.data;
  }
}
