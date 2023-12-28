import 'dart:convert';

class LoginArgument {
  LoginArgument({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;
  

  factory LoginArgument.fromJson(final String str) => LoginArgument.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginArgument.fromMap(final Map<String, dynamic> json) => LoginArgument(
        email: json["email"],
        password: json["password"],
        
      );
  
  Map<String,dynamic> toMap() => {
    "email": email,
    "password": password,
  };
}
