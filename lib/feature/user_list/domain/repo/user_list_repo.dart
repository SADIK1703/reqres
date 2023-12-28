import 'package:reqres/feature/user_list/_user_list_exports.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class UserListRepository{
  Future<DataState<BasePagingListModel<UserModel>>> fetchUserList(FetchUserListParams params);
}