// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthRequestData extends Equatable {
  final String login;
  final String password;
  const AuthRequestData({
    required this.login,
    required this.password,
  });

  AuthRequestData copyWith({
    String? login,
    String? password,
  }) {
    return AuthRequestData(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
    };
  }

  factory AuthRequestData.fromMap(Map<String, dynamic> map) {
    return AuthRequestData(
      login: map['login'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestData.fromJson(String source) =>
      AuthRequestData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [login, password];
}
