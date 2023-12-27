import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:reqres/product/_product_exports.dart';

enum PageStateEnum {
  loading,
  error,
  success,
  idle;
}

final class PageState<D> {
  final PageStateEnum pageState;
  final Failure? failure;
  final D? data;
  const PageState._(this.pageState, {this.failure, this.data});

  factory PageState.loading() {
    return const PageState._(PageStateEnum.loading);
  }
  factory PageState.error(final Failure failure) {
    return PageState._(PageStateEnum.error, failure: failure);
  }
  factory PageState.success(final D data) {
    return PageState._(PageStateEnum.success, data: data);
  }
  factory PageState.idle() {
    return const PageState._(PageStateEnum.error);
  }
}

mixin PageStateMixin<T> on ChangeNotifier {
  PageState<T> _pageState = PageState.loading();
  Failure? _failure;
  T? _data;

  void changePageState(PageState<T> newPageState) {
    _pageState = newPageState;
    _failure = newPageState.failure;
    _data = newPageState.data;
    notifyListeners();
  }

  FutureOr<void> callbackNotifier<K>(
    FutureOr<DataState<K>> Function() callback, {
    FutureOr<bool> Function(K? data)? isDataEmpty,
    FutureOr<Failure?> Function(K? data)? dataValidator,
    FutureOr<T> Function(K? data)? dataConverter,
    FutureOr<void> Function(K? data)? onSuccess,
    FutureOr<void> Function(Failure? failure)? onError,
  }) async {
    changePageState(PageState<T>.loading());
    DataState<K> result = await callback();
    result.when(
      error: (Failure failure) async {
        changePageState(PageState.error(failure));
        await onError?.call(failure);
      },
      success: (K data) async {
        final Failure? dataValidateError = await dataValidator?.call(data);
        if (dataValidateError != null) {
          changePageState(PageState.error(dataValidateError));
          await onError?.call(failure);
        } else if (await isDataEmpty?.call(data) ?? false) {
          changePageState(PageState.idle());
        } else {
          if (data is! T) {
            if (dataConverter != null) {
              changePageState(PageState.success(await dataConverter(data)));
              await onSuccess?.call(data);
            } else {
              Failure failure = DataTypeFailure(
                '''Data type (${data.runtimeType}) is not a subtype of $T.
                    If you want use data correctly,
                    please pass dataConverter function''',
              );
              changePageState(PageState.error(failure));
              await onError?.call(failure);
            }
          } else {
            changePageState(PageState.success(data));
            await onSuccess?.call(data);
          }
        }
      },
    );
  }

  PageState<T> get pageState => _pageState;
  T? get data => _data;
  Failure? get failure => _failure;
}
