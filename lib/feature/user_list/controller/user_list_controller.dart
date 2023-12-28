import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reqres/feature/user_list/_user_list_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class UserListController extends ChangeNotifier {
  final FetchUserListUsecase _fetchUserListUsecase;

  UserListController(this._fetchUserListUsecase) {
    pagingController = PagingController<int, User>(firstPageKey: 1);
    pagingController?.addPageRequestListener(pagination);
    pagination(1);
  }

  int currentPage = 1;

  PagingController<int, User>? pagingController;

  Future<void> pagination(int pageIndex) async {
    DataState<BasePagingListModel<User>> response = await _fetchUserListUsecase(FetchUserListParams(pageIndex));
    response.when<List<User>>(
      success: (data) {
        if (currentPage == data.totalPageCount) {
          currentPage = 1;
          pagingController?.appendPage(data.items, currentPage);
        } else {
          currentPage++;
          pagingController?.appendPage(data.items, currentPage);
        }
        return DataState.success(data.items);
      },
      error: (error) {
        pagingController?.error = error;
        return DataState.error(error);
      },
    );
  }

  Future<void> refresh() async {
    currentPage = 1;
    pagingController?.refresh();
  }

  void onDispose() {
    currentPage = 1;
    pagingController?.refresh();
  }
}
