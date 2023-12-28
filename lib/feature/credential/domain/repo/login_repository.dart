import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class LoginRepository {
  Future<DataState<LoginResponseModel>> login(final LoginArgument params);
  Future<DataState<LoginResponseModel>> register(final LoginArgument params);
}
