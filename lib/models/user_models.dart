class UserModel {
  String uid;
  String? handleName;
  String? displayName;
  String? avatarUrl;
  String? avatarUrlOnCloud;

  UserModel(
    this.uid, {
    this.displayName,
    this.avatarUrl,
    this.avatarUrlOnCloud,
  });
}
