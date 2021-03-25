import 'dart:convert';

class UserModel {
  UserModel({
    this.token,
    this.email,
    this.password,
  });

  final String token;
  final dynamic email;
  final dynamic password;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "email": email,
        "password": password,
      };
}
