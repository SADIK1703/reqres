import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginRepoImpl implements LoginRepository {
  const LoginRepoImpl(this._localStorageRepository);
  final LocalStorageRepository _localStorageRepository;
  @override
  Future<DataState<LoginResponseModel>> login(
    final LoginArgument params,
  ) async {
    var response = await dependencyInjector<BaseRequestRepository>().baseGet(
      requestParameters: params.toMap(),
      endPoint: Endpoints.login,
    );
    return response.when<LoginResponseModel>(
      success: (data) {
        _localStorageRepository.saveData<UserDataModel>(LocalStorageKeys.userData, UserDataModel.fromJson(data));
        return DataState.success(LoginResponseModel.fromJson(data));
      },
      error: (error) {
        _localStorageRepository.removeData(LocalStorageKeys.userData);
        return DataState.error(error);
      },
    );
  }
}
