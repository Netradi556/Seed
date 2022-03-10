import 'package:freezed_annotation/freezed_annotation.dart';

class User {
  final String handleName;
  final String sex;
  final DateTime birthDate;

  User({
    required this.handleName,
    required this.sex,
    required this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'sex': sex,
      'age': birthDate,
    };
  }
}
