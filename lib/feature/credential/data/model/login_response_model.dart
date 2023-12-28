import 'dart:convert';
import 'package:reqres/feature/credential/_login_exports.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    required super.token,
  });

  factory LoginResponseModel.fromJson(final String str) => LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(final Map<String, dynamic> json) => LoginResponseModel(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
