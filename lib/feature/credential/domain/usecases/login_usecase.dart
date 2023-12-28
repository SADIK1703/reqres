import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginUsecase implements Usecase<LoginResponseModel, LoginArgument> {
  final LoginRepository loginRepository;

  LoginUsecase({required this.loginRepository});
  @override
  Future<DataState<LoginResponseModel>> call(final LoginArgument params) async {
    return loginRepository.login(params);
  }
}
