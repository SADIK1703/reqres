import 'package:flutter/widgets.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginController extends ChangeNotifier with PageStateMixin<LoginResponse> {
  LoginController(this._registerUsecase);

  final RegisterUsecase _registerUsecase;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    changePageState(PageState.idle());
    var loginDataState = await _registerUsecase(
      LoginArgument(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    loginDataState.when(
      success: (data) {
        changePageState(PageState.success(data));
        Navigator.of(context).pushReplacementNamed(Routes.listUser.path);
        return DataState.success(data);
      },
      error: (error) {
        changePageState(PageState.error(error));
        CustomMessengerState.error.showCustomMessenger(context, error.errorMessage.content);
        return DataState.error(error);
      },
    );
  }
}
