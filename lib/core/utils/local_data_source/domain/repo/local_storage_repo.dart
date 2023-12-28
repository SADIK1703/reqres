import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class LocalStorageRepository {
  Future<DataState<T>> getData<T extends LocalStorageModel>(
    final LocalStorageKeys key,
    final T Function(String) fromJson,
  );
  Future<DataState<bool>> removeData(final LocalStorageKeys key);
  Future<DataState<bool>> saveData<T extends LocalStorageModel>(final LocalStorageKeys key, final T data);
}
