import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/login/_login_.exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginUsecase implements Usecase<BasePagingListModel<LoginResponseModel>, LoginArgument> {
  final LoginRepository loginRepository;

  LoginUsecase({required this.loginRepository});
  @override
  Future<DataState<BasePagingListModel<LoginResponseModel>>> call(final LoginArgument params) async {
    return loginRepository.login(params);
  }
}
