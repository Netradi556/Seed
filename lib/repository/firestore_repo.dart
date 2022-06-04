import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';

class FireStoreRepo {
  // FireStoreインスタンスの設定
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthRepo _authRepo = locator.get<AuthRepo>();

// Chat関係の処理================================================================
  // 1つのチャットルーム内のドキュメントを取得
  Stream<QuerySnapshot> getChatStream() {
    return firestore
        .collection('chatsample')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // ユーザーネームからユーザー？を取得する -> 目的忘れた
  getUserByUsername(String username) {
    firestore.collection("users").where("name", isEqualTo: username).get();
  }

// ユーザープロフィール関係の処理=====================================================
  // ユーザープロファイルの情報をアップロード
  Future<void> updateProfile(Map<String, String> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .update(editedContents);

    print('実行');
  }

  // TOP画面でユーザー情報を取得するときの処理

  // ユーザーが「いいね！」を押したときの処理

}
