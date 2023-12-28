import 'package:reqres/product/_product_exports.dart';

class NoInternetConnectionFailure extends RequestFailure {
   NoInternetConnectionFailure() : super(errorMessage: ErrorMessages.noInternetConnection());
}
