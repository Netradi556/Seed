import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';

class StorageRepo {
  // インスタンスの設定-----------------------------
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://our-first-seed.appspot.com");
  final AuthRepo _authRepo = locator.get<AuthRepo>();

  // プロフィール画像のUpDl処理----------------------
  Future<String> uploadFile(File file) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    var storageRef = _storage.ref().child("user/profile/$userId");
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    String imgPath =
        await _storage.ref().child("user/profile/$uid").getDownloadURL();
    return imgPath;
  }

  // 各種証明書のアップロード処理----------------------

}
