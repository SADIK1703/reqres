import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class SecureStorageRepositoryImpl implements LocalStorageRepository {
  final FlutterSecureStorage secureStorage;

  SecureStorageRepositoryImpl(this.secureStorage);

  @override
  Future<DataState<String>> getData(
    final LocalStorageKeys key,
  ) async {
    try {
      final String? value = await secureStorage.read(key: key.name);
      if (value?.isNotEmpty ?? false) {
        return DataState.success(value!);
      } else {
        return DataState.error(UnableToGetCachedDataFailure());
      }
    } catch (e) {
      return DataState.error(UnableToGetCachedDataFailure());
    }
  }

  @override
  Future<DataState<bool>> removeData(final LocalStorageKeys key) async {
    try {
      await secureStorage.delete(key: key.name);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(UnableToRemoveDataFromCacheFailure());
    }
  }

  @override
  Future<DataState<bool>> saveData(final LocalStorageKeys key, final String data) async {
    try {
      await secureStorage.write(key: key.name, value: data);
      return DataState.success(true);
    } catch (e) {
      return DataState.error(UnableToCacheDataFailure());
    }
  }
}
