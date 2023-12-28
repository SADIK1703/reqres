import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/user_list/_user_list_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class UserListPage extends ConsumerStatefulWidget {
  const UserListPage({super.key});

  @override
  ConsumerState<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
  final userListController = dependencyInjector<ChangeNotifierProvider<UserListController>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(route: Routes.listUser),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return RefreshIndicator(
              onRefresh: ref.read(userListController).refresh,
              child: PagedListView<int, User>(
                pagingController:
                    ref.read(userListController).pagingController ?? PagingController<int, User>(firstPageKey: 1),
                builderDelegate: PagedChildBuilderDelegate<User>(
                  itemBuilder: (context, item, index) => UserCard(user: item),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
