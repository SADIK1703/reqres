import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class GetRequest implements Usecase<String, PostRequestParams> {
  BaseRequestRepository repository;

  GetRequest(this.repository);

  @override
  Future<DataState<String>> call(final params) async {
    return repository.basePost(
      requestBody: params.requestBody,
      endPoint: params.endPoint,
    );
  }
}
