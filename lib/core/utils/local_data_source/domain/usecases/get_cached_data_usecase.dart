import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class GetCachedDataUsecase implements Usecase<String, GetCachedDataParam> {
  LocalStorageRepository repository;

  GetCachedDataUsecase(this.repository);

  @override
  Future<DataState<String>> call(final GetCachedDataParam params) async {
    return repository.getData(params.localStorageKey);
  }
}
