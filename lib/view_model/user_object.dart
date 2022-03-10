class User {
  final String sex;
  final int age;

  User(
    this.sex,
    this.age,
  );

  Map<String, dynamic> toMap() {
    return {
      'sex': sex,
      'age': age,
    };
  }
}
