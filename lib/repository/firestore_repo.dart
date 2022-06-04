import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/repository/auth_repo.dart';

class FireStoreRepo {
  // FireStoreインスタンスの設定
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthRepo _authRepo = locator.get<AuthRepo>();

  // Chat関係の処理-----------------------------------
  getUserByUsername(String username) {
    firestore.collection("users").where("name", isEqualTo: username).get();
  }

  // ユーザープロフィール関係の処理-----------------------
  Future<void> updateProfile(Map<String, String> editedContents) async {
    print('');
  }

  // マッチング関係の処理-------------------------------

}
