import 'package:flutter/material.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class RootController extends ChangeNotifier {
  RootController(this._localStorageRepository);

  final LocalStorageRepository _localStorageRepository;

  Future<DataState<Routes>> onInit() async {
    var userDataState = await _localStorageRepository.getData<UserDataModel>(
      LocalStorageKeys.userData,
      UserDataModel.fromJson,
    );

    return userDataState.when<Routes>(
      success: (data) {
        return DataState.success(Routes.listUser);
      },
      error: (error) {
        return DataState.success(Routes.login);
      },
    );
  }
}
