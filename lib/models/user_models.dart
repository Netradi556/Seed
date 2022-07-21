class UserModel {
  String uid;
  String? handleName;
  String? avatarUrl;
  String? avatarUrlOnCloud;

  UserModel(
    this.uid, {
    this.handleName,
    this.avatarUrl,
    this.avatarUrlOnCloud,
  });
}
