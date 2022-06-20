import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';

class FireStoreRepo {
  // FireStoreインスタンスの設定
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthRepo _authRepo = locator.get<AuthRepo>();

// Chat関係の処理============================================================================================
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

// ユーザープロフィール関係の処理=================================================================================
  Future<void> setUserDocument() async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    firestore.collection('user').doc(userId).set({
      'handleName': '',
      'sex': 'none',
      'birthDate': Timestamp.fromDate(DateTime.now()),
      'score': 0,
      'receivedGood': 0,
    });

    firestore
        .collection('user')
        .doc(userId)
        .collection('MemberStatus')
        .doc(userId)
        .set({
      'goodCount': 30,
      'licenseType': 'normal',
      'entryDate': Timestamp.fromDate(DateTime.now()),
      'nextGivenDate': '',
    });

    firestore
        .collection('user')
        .doc(userId)
        .collection('MyNotification')
        .doc('firstNotification')
        .set({
      'publishedDate': Timestamp.fromDate(DateTime.now()),
      'isRead': false,
      'title': 'FirstNotification',
      'contents': 'これは初回登録時に生成される通知です'
    });
  }

  // ユーザープロファイルの情報をアップロード：ProfileEdit
  Future<void> updateProfile(Map<String, String> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    firestore.collection('user').doc(userId).update(editedContents);

    // ignore: avoid_print
    print('実行');
  }

  // ユーザープロファイルの情報を新規作成：初回登録時に実行 Auth
  Future<void> setProfile(Map<String, String> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .set(editedContents);

    // ignore: avoid_print
    print('実行');
  }

  // TOP画面でユーザー情報を取得するときの処理：女性ユーザーのみ
  // 性別判定をどこでやるか、異性のみ取得したい
  // ------------------------------------------------------------------------------動作確認で5件に絞ってみる
  Future<QuerySnapshot> getQuerySnapshotAtUserTop() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('sex', isEqualTo: '女性')
        .limit(20)
        .get();
    return snapshot;
  }

  Future<void> addQueryDocumentSnapshotAtUserTop(
      Future<QuerySnapshot> querySnapshot, int loadCard) async {
    querySnapshot.then((documentSnapshot) {
      // 取得済みのドキュメントのうち、最後のドキュメント
      final lastVisible = documentSnapshot.docs[documentSnapshot.size - 1];
      // ignore: unused_local_variable
      final next = FirebaseFirestore.instance
          .collection('user')
          .startAfter([lastVisible]).limit(loadCard);
    });
    // ignore: avoid_print
    print('取得成功');
  }

  // ユーザーが「いいね！」を押したときの処理

}
