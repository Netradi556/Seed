class UserModel {
  String uid;
  String? displayName;
  String avatarUrl;

  UserModel(this.uid, {this.displayName, required this.avatarUrl});
}
