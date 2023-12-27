import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.failureMessage);

  final String failureMessage;
}
