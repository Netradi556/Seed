import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/profile_item_models.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';

class FireStoreRepo {
  // FireStoreインスタンスの設定
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthRepo _authRepo = locator.get<AuthRepo>();

  FireStoreRepo();

  // トップレベルコレクションの設定
  // TODO: 後で削除
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  // TODO: 後で改名
  final CollectionReference newUserCollection =
      FirebaseFirestore.instance.collection('User');

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

  Query fetchFirstUsers() {
    final snapshots = FirebaseFirestore.instance
        .collection('user')
        .where('sex', isEqualTo: '女性')
        .limit(20);
    return snapshots;
  }

  Query fetchUsers(DocumentSnapshot fetchedLastDoc) {
    final snapshots = FirebaseFirestore.instance
        .collection('user')
        .where('sex', isEqualTo: '女性')
        .startAfterDocument(fetchedLastDoc)
        .limit(20);
    return snapshots;
  }

  Future<QuerySnapshot> getQuerySnapshotByCriteria() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('sex', isEqualTo: '女性')
        .where('livingPlace', isEqualTo: '東京都')
        .limit(20)
        .get();
    return snapshot;
  }

  Future<QuerySnapshot> getQuerySnapshotByMultipleCriteria(
      Map<String, dynamic> criteria, int limit) async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('user');
    criteria.forEach((itemName, criteria) =>
        collectionRef.where(itemName, isEqualTo: criteria));

    Future<QuerySnapshot<Object?>> snapshot = collectionRef.limit(limit).get();
    return snapshot;
  }

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
  // TODO: Crit: チャット機能の開発時に削除検討
  getUserByUsername(String username) {
    firestore.collection("users").where("name", isEqualTo: username).get();
  }

  void sendMessage(String message, int sendTime, String senderName) {
    const String collectionName = 'chatsample';
    firestore.collection(collectionName).add(
      {
        'message': message,
        'timestamp': sendTime,
        'sender': senderName,
      },
    );
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
  // アカウント作成時のドキュメント作成処理
  Future<void> setUserDocument() async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    // Userコレクション直下のパラメータ
    newUserCollection.doc(userId).set(InitialProfileParam().initialParamTop);

    // Userコレクション->Member Statusコレクション
    newUserCollection
        .doc(userId)
        .collection('MemberStatus')
        .doc(userId)
        .set(InitialProfileParam().initialParamMemberStatus);

    // Userコレクション->MyNotificationコレクション
    newUserCollection
        .doc(userId) // 最初に登録する通知だけUserIDと同じ
        .collection('MyNotification')
        .doc('firstNotification')
        .set(InitialProfileParam().initialParamMyNotification);
  }

  //
  Future<void> NEWupdateProfile(Map<String, String> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    // TODO: コレクションの変更
    newUserCollection.doc(userId).update(editedContents);

    // ignore: avoid_print
    print('プロファイルアップデートが完了しました');
  }

  // TODO: mid: ユーザー修正画面が落ち着いたら消去
  // ユーザープロファイルの情報をアップロード：ProfileEdit
  Future<void> OLDupdateProfile(Map<String, String> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    // TODO: コレクションの変更
    userCollection.doc(userId).update(editedContents);

    // ignore: avoid_print
    print('実行');
  }

  // ユーザープロファイルの情報を新規作成：初回登録時に実行 Auth
  Future<void> updateProfile(Map<String, dynamic> editedContents) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    newUserCollection.doc(userId).update(editedContents);

    // ignore: avoid_print
    print('実行');
  }

  Future<DocumentSnapshot> fetchMyDocumentSnapshot() async {
    final String userUid = await _authRepo.getCurrentUserUID();
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('User').doc(userUid).get();
    return documentSnapshot;
  }
}
