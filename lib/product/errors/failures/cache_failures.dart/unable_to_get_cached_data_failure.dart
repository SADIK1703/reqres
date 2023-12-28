import 'package:reqres/product/_product_exports.dart';

class UnableToGetCachedDataFailure extends CacheFailure {
  UnableToGetCachedDataFailure() : super(errorMessage: ErrorMessages.unableToGetCachedData());
}
