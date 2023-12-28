import 'package:flutter/material.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/feature/root/view/pages/_pages_exports.dart';

enum Routes {
  baseRoute('/', 'baseRoute'),
  login('/login', 'login'),
  listUser('/listUser', 'listUser'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}

extension RouteHelper on Routes {
  static Map<String, Widget Function(BuildContext)> routeReceiver() {
    return {
      Routes.baseRoute.name: (context) => const RootPage(),
      Routes.login.name: (context) => const LoginPage(),
      Routes.listUser.name: (context) => const RootPage(),
    };
  }
}
