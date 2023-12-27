import 'package:reqres/product/_product_exports.dart';

abstract class DataState<T> {
  abstract final Failure? failure;
  abstract final T? data;

  factory DataState.success({required T data}) {
    return SuccessDataState(data);
  }

  factory DataState.error({required Failure failure}) {
    return ErrorDataState(failure);
  }

  void when({void Function(T)? success, void Function(Failure)? error});
}

class SuccessDataState<T> implements DataState<T> {
  @override
  final Failure? failure = null;

  @override
  final T data;

  SuccessDataState(this.data);

  @override
  void when({void Function(T)? success, void Function(Failure)? error}) {
    success?.call(data);
  }
}

class ErrorDataState<T> implements DataState<T> {
  @override
  final Failure failure;

  @override
  final T? data = null;

  ErrorDataState(this.failure);

  @override
  void when({void Function(T)? success, void Function(Failure)? error}) {
    error?.call(failure);
  }
}
