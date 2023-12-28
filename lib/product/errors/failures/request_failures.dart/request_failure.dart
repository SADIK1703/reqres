import 'package:reqres/product/_product_exports.dart';

class RequestFailure extends Failure {
  RequestFailure({ErrorMessages? errorMessage}) : super(errorMessage ?? ErrorMessages.somethingWentWrong());

  @override
  List<Object?> get props => [];
}
