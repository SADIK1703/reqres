import 'package:reqres/product/_product_exports.dart';

class CustomMessageFailure extends Failure {
  CustomMessageFailure(String customErrorMessage) : super(ErrorMessages(customErrorMessage));

  @override
  List<Object?> get props => [];
}
