import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class MainRequestImpl implements BaseRequestRepository {
  MainRequestImpl(this._dio);

  final Dio _dio;

  @override
  Future<DataState<String>> baseGet({
    required final Endpoints endPoint,
    required final requestParameters,
  }) async {
    return _errorHandler(
      () {
        return _dio.get(
          endPoint.path,
          queryParameters: requestParameters,
          options: Options(
            responseType: ResponseType.plain,
            contentType: "application/json",
            method: "GET",
            validateStatus: (final int? statusCode) => true,
          ),
        );
      },
    );
  }

  @override
  Future<DataState<String>> basePost({
    required final Map<String, dynamic> requestBody,
    required final Endpoints endPoint,
  }) async {
    return _errorHandler(
      () async {
        return _dio.post(
          endPoint.path,
          data: jsonEncode(requestBody),
          options: Options(
            responseType: ResponseType.plain,
            contentType: "application/json",
            method: "POST",
            validateStatus: (final int? statusCode) {
              return true;
            },
          ),
        );
      },
    );
  }

  Future<DataState<String>> _errorHandler(final Future<Response> Function() requestFunction) async {
    Response dioResponse;
    try {
      dioResponse = await requestFunction();
    } on SocketException {
      return DataState.error(NoInternetConnectionFailure());
    } on DioException catch (error) {
      return DataState.error(error.getFailure());
    } on Failure catch (failure) {
      return DataState.error(failure);
    }
    return _handleResponse(dioResponse);
  }

  Future<DataState<String>> _handleResponse(final Response response) async {
    if (StatusCodeEnumsExtension.isSuccess(StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode))) {
      return DataState.success(response.data ?? '');
    } else {
      return DataState.error(CustomMessageFailure(json.decode(response.data)["error"] ?? ''));
    }
  }
}
