import 'package:firebase_auth/firebase_auth.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// getUser()
// UserModelオブジェクトを返す処理はuser_controller.dartに移譲







class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth auth1 = FirebaseAuth
      .instance; // ==============================================_authとプライベートアクセスに変更すること：セキュリティ面の理由から

  AuthRepo();

  // UserModelで呼び出される初期化処理
  Future<UserModel> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var firebaseUser = auth1.currentUser!;
    return UserModel(
      firebaseUser.uid,
      handleName: pref.getString(firebaseUser.uid
          .toString()), // ===============================FireStoreからデータを取得したい
      avatarUrl:
          '', // =========================================================================パスを最初から設定したい
    );
  }

  Future<String> getCurrentUserUID() async {
    var firebaseUser = auth1.currentUser!;
    String curretnUserUID = firebaseUser.uid;
    return curretnUserUID;
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
        await auth1.signInWithEmailAndPassword(
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
        await auth1.signInWithCredential(credential);
    return userCredential;
  }
}
