// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthResponseData extends Equatable {
  final bool success;
  const AuthResponseData({
    required this.success,
  });

  AuthResponseData copyWith({
    bool? success,
  }) {
    return AuthResponseData(
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
    };
  }

  factory AuthResponseData.fromMap(Map<String, dynamic> map) {
    return AuthResponseData(
      success: map['success'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseData.fromJson(String source) =>
      AuthResponseData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [success];
}
