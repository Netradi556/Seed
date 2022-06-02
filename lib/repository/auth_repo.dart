import 'package:firebase_auth/firebase_auth.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepo();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final User? user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser!;
    return UserModel(firebaseUser.uid,
        displayName: firebaseUser.displayName, avatarUrl: '');
  }
}
