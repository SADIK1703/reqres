import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/user_list/_user_list_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class UserListRepoImpl implements UserListRepository {
  UserListRepoImpl(this._getRequestUsecase);
  final GetRequestUsecase _getRequestUsecase;

  @override
  Future<DataState<BasePagingListModel<UserModel>>> fetchUserList(FetchUserListParams params) async {
    var response = await _getRequestUsecase(
      GetRequestParams(
        requestParameters: params.toMap(),
        endPoint: Endpoints.listUsers,
      ),
    );
    return response.when<BasePagingListModel<UserModel>>(
      success: (data) {
        final BasePagingListModel<UserModel> listModel = BasePagingListModel<UserModel>.fromJson(
          data,
          UserModel.fromMap,
        );
        return DataState.success(listModel);
      },
      error: (error) {
        return DataState.error(error);
      },
    );
  }
}
