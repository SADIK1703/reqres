import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class UnsuccessfulLoginFailure extends RequestFailure {
  UnsuccessfulLoginFailure(): super(errorMessage: LoginErrorMessage());
}