import 'package:flutter/material.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class RootController extends ChangeNotifier {
  RootController(this._postRequest, this._getCachedDataUsecase);

  final GetCachedDataUsecase _getCachedDataUsecase;
  final PostRequestUsecase _postRequest;

  Future<DataState<Routes>> onInit() async {
    var userDataState = await _getCachedDataUsecase(
      GetCachedDataParam(LocalStorageKeys.userData),
    );

    return userDataState.when<Routes>(
      success: (data) async {
        UserDataModel userData = UserDataModel.fromJson(data);
        DataState<String> loginResponse = await _postRequest(
          PostRequestParams(
            requestBody: LoginArgument(email: userData.email, password: userData.password).toMap(),
            endPoint: Endpoints.login,
          ),
        );

        return loginResponse.when(
          success: (p0) => DataState.success(Routes.listUser),
          error: (p0) => DataState.success(Routes.register),
        );
      },
      error: (error) {
        return DataState.success(Routes.register);
      },
    );
  }
}
