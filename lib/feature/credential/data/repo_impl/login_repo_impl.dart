import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginRepoImpl implements LoginRepository {
  const LoginRepoImpl(this._postRequestUsecase, this._saveDataCacheUsecase, this._removeCachedDataUsecase);
  final PostRequestUsecase _postRequestUsecase;
  final SaveDataCacheUsecase _saveDataCacheUsecase;
  final RemoveCachedDataUsecase _removeCachedDataUsecase;
  @override
  Future<DataState<LoginResponseModel>> login(
    final LoginArgument params,
  ) async {
    var response = await _postRequestUsecase(
      PostRequestParams(
        requestBody: params.toMap(),
        endPoint: Endpoints.login,
      ),
    );
    return response.when<LoginResponseModel>(
      success: (data) {
        final LoginResponseModel responseModel = LoginResponseModel.fromJson(response.data!);
        final UserDataModel cacheData = UserDataModel(email: params.email, password: params.password);
        _saveDataCacheUsecase(SaveDataCacheParam(cacheData, LocalStorageKeys.userData));
        return DataState.success(responseModel);
      },
      error: (error) {
        _removeCachedDataUsecase(RemoveCachedDataParam(LocalStorageKeys.userData));
        return DataState.error(error);
      },
    );
  }

  @override
  Future<DataState<LoginResponseModel>> register(
    final LoginArgument params,
  ) async {
    var response = await _postRequestUsecase(
      PostRequestParams(
        requestBody: params.toMap(),
        endPoint: Endpoints.register,
      ),
    );
    return response.when<LoginResponseModel>(
      success: (data) {
        final LoginResponseModel responseModel = LoginResponseModel.fromJson(response.data!);
        final UserDataModel cacheData = UserDataModel(email: params.email, password: params.password);
        _saveDataCacheUsecase(SaveDataCacheParam(cacheData, LocalStorageKeys.userData));
        return DataState.success(responseModel);
      },
      error: (error) {
        _removeCachedDataUsecase(RemoveCachedDataParam(LocalStorageKeys.userData));
        return DataState.error(error);
      },
    );
  }
}
