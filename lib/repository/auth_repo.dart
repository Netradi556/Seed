import 'package:firebase_auth/firebase_auth.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // _authとプライベートアクセスに変更すること：セキュリティ面の理由から
  final FirebaseAuth auth1 = FirebaseAuth.instance;

  AuthRepo();

  Future signInWithEmailAddress(String email, String password) async {
    final UserCredential userCredential =
        await auth1.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

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

  Future<UserModel> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var firebaseUser = auth1.currentUser!;
    return UserModel(
      firebaseUser.uid,
      handleName: pref.getString(firebaseUser.uid.toString()),
      avatarUrl: '',
    );
  }
}
