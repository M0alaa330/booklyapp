import 'package:dio/dio.dart';

abstract class Faliure {
  final String errormsg;
  Faliure(this.errormsg);
}

class FaluierServer extends Faliure {
  FaluierServer(super.errormsg);
  factory FaluierServer.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return FaluierServer("Connection Timeout with Apiserver");
      case DioExceptionType.sendTimeout:
        return FaluierServer("Send Timeout with Apiserver");
      case DioExceptionType.receiveTimeout:
        return FaluierServer("Receive Timeout with Apiserver");
      case DioExceptionType.badCertificate:
        return FaluierServer("Badcertificate with Apiserver");
      case DioExceptionType.badResponse:
        return FaluierServer.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return FaluierServer("Request to Apiserver was canceled ");
      case DioExceptionType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return FaluierServer("No internet connection");
        }
        return FaluierServer("Unexpected error, try again later");
      case DioExceptionType.unknown:
        return FaluierServer("Unknown error occurred");
      default:
        return FaluierServer("Unexpected error, try again later");
    }
  }
  factory FaluierServer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return FaluierServer(response['error']['message']);
    } else if (statusCode == 404) {
      return FaluierServer(
          "Your request is not found , plase try again later ");
    } else if (statusCode == 500) {
      return FaluierServer("Internal Server error ,  try again later");
    } else {
      return FaluierServer("Oops there was an error , Please try again later ");
    }
  }
}
