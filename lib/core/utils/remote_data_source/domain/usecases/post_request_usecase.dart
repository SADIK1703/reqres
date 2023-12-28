import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class PostRequestUsecase implements Usecase<String, PostRequestParams> {
  BaseRequestRepository repository;

  PostRequestUsecase(this.repository);

  @override
  Future<DataState<String>> call(final params) async {
    return repository.basePost(
      requestBody: params.requestBody,
      endPoint: params.endPoint,
    );
  }
}
