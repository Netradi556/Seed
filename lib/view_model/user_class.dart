import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_class.freezed.dart';
part 'user_class.g.dart';

// freezedを導入すること
// https://www.youtube.com/watch?v=RaThk0fiphA&ab_channel=Flutter

@Freezed()
class User with _$User {
  const factory User({
    required int id,
    @Default(true) bool isImportant,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
