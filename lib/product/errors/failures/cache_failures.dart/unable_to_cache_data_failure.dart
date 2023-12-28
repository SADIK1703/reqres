import 'package:reqres/product/_product_exports.dart';

class UnableToCacheDataFailure extends CacheFailure {
  UnableToCacheDataFailure() : super(errorMessage: ErrorMessages.unableToCacheData());
}
