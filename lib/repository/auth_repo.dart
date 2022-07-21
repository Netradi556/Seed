import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:google_sign_in/google_sign_in.dart';

// getUser()
// UserModelオブジェクトを返す処理はuser_controller.dartに移譲

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepo();

  // UserModelで呼び出される初期化処理
  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser!;
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('User')
        .doc(firebaseUser.uid)
        .get();
    // print(documentSnapshot.get('handleName'));
    return UserModel(
      firebaseUser.uid,
      handleName: documentSnapshot.get('handleName'),
      avatarUrl:
          '', // =========================================================================パスを最初から設定したい
    );
  }

  Future<String> getCurrentUserUID() async {
    var firebaseUser = _auth.currentUser!;
    String currentUserUID = firebaseUser.uid;
    return currentUserUID;
  }

//
//
//
//
//
//
// ログイン時の認証処理=======================================================================================
  // メールアドレスでログインする処理
  Future signInWithEmailAddress(String email, String password) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  // グーグルログインの処理
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    return userCredential;
  }
}
