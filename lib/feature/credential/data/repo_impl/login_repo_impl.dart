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
    var response = await dependencyInjector<BaseRequestRepository>().basePost(
      requestBody: params.toMap(),
      endPoint: Endpoints.login,
    );
    return response.when<LoginResponseModel>(
      success: (data) {
        final LoginResponseModel responseModel = LoginResponseModel.fromJson(response.data!);
        final UserDataModel cacheData = UserDataModel(email: params.email, password: params.password);
        _localStorageRepository.saveData(LocalStorageKeys.userData, cacheData.toJson());
        return DataState.success(responseModel);
      },
      error: (error) {
        _localStorageRepository.removeData(LocalStorageKeys.userData);
        return DataState.error(error);
      },
    );
  }
}
