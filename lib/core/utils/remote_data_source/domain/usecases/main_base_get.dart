import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class PostRequest implements Usecase<String, GetRequestParams> {
  BaseRequestRepository repository;

  PostRequest(this.repository);

  @override
  Future<DataState<String>> call(final params) async {
    return repository.baseGet(
      requestParameters: params.requestParameters,
      endPoint: params.endPoint,
    );
  }
}
