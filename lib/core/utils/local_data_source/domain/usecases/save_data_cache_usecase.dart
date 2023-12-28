import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class SaveDataCacheUsecase implements Usecase<bool, SaveDataCacheParam> {
  LocalStorageRepository repository;

  SaveDataCacheUsecase(this.repository);

  @override
  Future<DataState<bool>> call(final SaveDataCacheParam params) async {
    return repository.saveData(params.localStorageKeys, params.localStorageModel.toJson());
  }
}
