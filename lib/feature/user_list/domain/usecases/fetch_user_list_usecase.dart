import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/user_list/_user_list_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class FetchUserListUsecase implements Usecase<BasePagingListModel<UserModel>, FetchUserListParams> {
  final UserListRepository _userListRepository;

  FetchUserListUsecase(this._userListRepository);
  @override
  Future<DataState<BasePagingListModel<UserModel>>> call(final FetchUserListParams params) async {
    return _userListRepository.fetchUserList(params);
  }
}
