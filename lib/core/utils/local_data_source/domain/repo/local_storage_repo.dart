import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class LocalStorageRepository {
  Future<DataState<String>> getData(final LocalStorageKeys key);
  Future<DataState<bool>> removeData(final LocalStorageKeys key);
  Future<DataState<bool>> saveData(final LocalStorageKeys key, final String data);
}
