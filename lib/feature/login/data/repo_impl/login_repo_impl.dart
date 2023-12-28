import 'package:reqres/feature/login/_login_.exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginRepoImpl implements LoginRepository {
  const LoginRepoImpl();
  @override
  Future<DataState<BasePagingListModel<LoginResponseModel>>> login(
    final LoginArgument params,
  ) async {
    return DataState.success(
      BasePagingListModel(
        pageCount: 1,
        itemPerPage: 6,
        totalItem: 12,
        totalPageCount: 2,
        items: [],
      ),
    );
  }
}
