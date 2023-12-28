import 'dart:async';

import 'package:reqres/product/_product_exports.dart';

abstract class DataState<T> {
  abstract final Failure? failure;
  abstract final T? data;

  factory DataState.success(T data) {
    return SuccessDataState(data);
  }

  factory DataState.error(Failure failure) {
    return ErrorDataState(failure);
  }

  FutureOr<DataState<K>> when<K>({
    FutureOr<DataState<K>> Function(T)? success,
    FutureOr<DataState<K>> Function(Failure)? error,
  });
}

class SuccessDataState<T> implements DataState<T> {
  @override
  final Failure? failure = null;

  @override
  final T data;

  SuccessDataState(this.data);

  @override
  FutureOr<DataState<K>> when<K>({
    FutureOr<DataState<K>> Function(T)? success,
    FutureOr<DataState<K>> Function(Failure)? error,
  }) {
    return success!.call(data);
  }
}

class ErrorDataState<T> implements DataState<T> {
  @override
  final Failure failure;

  @override
  final T? data = null;

  ErrorDataState(this.failure);

  @override
  FutureOr<DataState<K>> when<K>({
    FutureOr<DataState<K>> Function(T)? success,
    FutureOr<DataState<K>> Function(Failure)? error,
  }) {
    error?.call(failure);
    return DataState<K>.error(failure);
  }
}
