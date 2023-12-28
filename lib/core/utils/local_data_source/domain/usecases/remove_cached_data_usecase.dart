import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class RemoveCachedDataUsecase implements Usecase<bool, RemoveCachedDataParam> {
  LocalStorageRepository repository;

  RemoveCachedDataUsecase(this.repository);

  @override
  Future<DataState<bool>> call(final RemoveCachedDataParam params) async {
    return repository.removeData(params.localStorageKeys);
  }
}
