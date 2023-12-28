import 'package:reqres/product/_product_exports.dart';

class TimeoutFailure extends RequestFailure {
   TimeoutFailure() : super(errorMessage: ErrorMessages.badInternetConnection());
}
