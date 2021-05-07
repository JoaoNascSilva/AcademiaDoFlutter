import 'dart:convert';

class UserModel {
  int id;
  String name;
  String email;
  String password;
  bool isActive;
  String theme;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.isActive,
    this.theme,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'isActive': isActive,
      'theme': theme,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      isActive: map['isActive'],
      theme: map['theme'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
