import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class BaseRequestRepository {
  Future<DataState<String>> basePost({
    required final Map<String, dynamic> requestBody,
    required final Endpoints endPoint,
  });

  Future<DataState<String>> baseGet({
    required final Map<String, dynamic> requestParameters,
    required final Endpoints endPoint,
  });
}
