import 'package:reqres/feature/login/_login_.exports.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class LoginRepository {
  Future<DataState<BasePagingListModel<LoginResponseModel>>> login(final LoginArgument params);
}
