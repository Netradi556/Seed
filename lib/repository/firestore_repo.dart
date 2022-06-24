import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';

class FireStoreRepo {
  // FireStoreインスタンスの設定
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthRepo _authRepo = locator.get<AuthRepo>();

  // トップレベルコレクションの設定
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

//
//
//
//
//
//
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
//
//
//
//
//
//
// マッチング関係の処理=========================================================================================
  // ユーザーが「いいね！」を押したときの処理
  Future<void> sendGood(String myUid, String userUid) async {
    var collectionRef = userCollection.doc(myUid).collection('ReceivedGood');
    var doc = await collectionRef.doc(myUid).get();
    bool docExists = doc.exists;

    if (docExists) {
      // 自分と相手側の'MatchedUser'コレクションへのドキュメント登録
      userCollection.doc(myUid).collection('MatchedUser').doc(userUid).set({});
      userCollection.doc(userUid).collection('MatchedUser').doc(myUid).set({});

      // 相手側の'SendGood'からドキュメント削除
      userCollection.doc(userUid).collection('SendGood').doc(myUid).delete();

      // ポップアップ画面の表示ー＞UserController側で実装？
    } else {
      // 自分側：SendGood、相手側：ReceivedGoodへドキュメント登録
      userCollection.doc(myUid).collection('SendGood').doc(userUid).set({});
      userCollection.doc(userUid).collection('ReceivedGood').doc(myUid).set({});
    }
  }
//
//
//
//
//
//
// ユーザープロフィール関係の処理=================================================================================
  Future<void> setUserDocument() async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;
    var now = DateTime.now();
    var dateOnly = DateTime(now.year, now.month, now.day);
    var nextGivenDate = DateTime(now.year, now.month + 1, now.day);

    firestore.collection('user').doc(userId).set({
      'handleName': '',
      'sex': 'none',
      'age': 0,
      'profileImagePath': '',
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
      'entryDate': Timestamp.fromDate(dateOnly),
      'nextGivenDate': Timestamp.fromDate(nextGivenDate),
      'birthDate': Timestamp.fromDate(dateOnly),
    });

    firestore
        .collection('user')
        .doc(userId)
        .collection('MyNotification')
        .doc('firstNotification')
        .set({
      'publishedDate': Timestamp.fromDate(dateOnly),
      'isRead': false,
      'title': 'FirstNotification',
      'contents': 'これは初回登録時に生成される通知です'
    });
  }

  // ユーザープロファイルの情報をアップロード：ProfileEdit
  Future<void> updateProfile(Map<String, String> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    userCollection.doc(userId).update(editedContents);

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

//
//
//
//
//
//
// ページネーションの処理==============================================================================================
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

}
