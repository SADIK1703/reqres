import 'package:flutter/widgets.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginController with ChangeNotifier {

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  PageState<LoginResponse> pageState = PageState.idle();

  

}
