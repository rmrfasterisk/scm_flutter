import 'dart:convert';

class UserModel {
  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
  });

  final String name;
  final String email;
  final String role;
  final String uid;

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'user_id': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      uid: map['user_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
