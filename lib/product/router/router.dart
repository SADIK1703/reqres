import 'package:flutter/cupertino.dart';
import 'package:reqres/product/_product_exports.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    for (var entry in RouteHelper.routeReceiver().entries) {
      if (entry.key == settings.name) {
        return CupertinoPageRoute(builder: entry.value);
      }
    }
    return CupertinoPageRoute(builder: RouteHelper.routeReceiver()[Routes.baseRoute]!);
  }
}
