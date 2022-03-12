class UserBasicProfile {
  final String handleName;
  final String sex;
  final DateTime birthDate;

  UserBasicProfile({
    required this.handleName,
    required this.sex,
    required this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'handleName': handleName,
      'sex': sex,
      'age': birthDate,
    };
  }

  UserBasicProfile.fromMap(Map<String, dynamic> userMap)
      : handleName = userMap["handleName"],
        sex = userMap["sex"],
        birthDate = userMap["birthDate"];
}

class UserFullProfile {
  final String handleName;
  final String sex;
  final DateTime birthDate;

  UserFullProfile({
    required this.handleName,
    required this.sex,
    required this.birthDate,
  });
}
