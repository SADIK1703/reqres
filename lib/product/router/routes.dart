import 'package:flutter/material.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/feature/root/view/pages/_pages_exports.dart';
import 'package:reqres/feature/user_list/view/pages/user_list_page.dart';

enum Routes {
  baseRoute('/', 'Base Route'),
  register('/login', 'Login'),
  listUser('/listUser', 'User List'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}

extension RouteHelper on Routes {
  static Map<String, Widget Function(BuildContext)> routeReceiver() {
    return {
      Routes.baseRoute.path: (context) => const RootPage(),
      Routes.register.path: (context) => const LoginPage(),
      Routes.listUser.path: (context) => const UserListPage(),
    };
  }
}
