import 'package:equatable/equatable.dart';
import 'package:reqres/product/_product_exports.dart';

abstract class Failure extends Equatable {
  const Failure(this.errorMessage);

  final ErrorMessages errorMessage;
}

