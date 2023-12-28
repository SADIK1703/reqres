import 'dart:convert';

import 'package:reqres/core/_core_exports.dart';

class UserDataModel implements LocalStorageModel{
  final String? password;
  final String? email;

  UserDataModel({required this.password, required this.email});

  factory UserDataModel.fromJson(final String str) => UserDataModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory UserDataModel.fromMap(final Map<String, dynamic> json) => UserDataModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
