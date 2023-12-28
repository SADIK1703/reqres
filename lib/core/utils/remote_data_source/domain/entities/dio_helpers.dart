import 'package:dio/dio.dart';
import 'package:reqres/product/_product_exports.dart';
import 'package:reqres/product/errors/failures/request_failures.dart/timeout_failure.dart';

extension DioHelper on DioException{
  Failure getFailure(){
    switch (type) {

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure();
      case DioExceptionType.badResponse:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return RequestFailure(errorMessage: ErrorMessages.somethingWentWrong());
    }
  }
}