import 'package:reqres/product/_product_exports.dart';

class CacheFailure extends Failure {
  CacheFailure({ErrorMessages? errorMessage}) : super(errorMessage ?? ErrorMessages.somethingWentWrong());

  @override
  List<Object?> get props => [];
}
