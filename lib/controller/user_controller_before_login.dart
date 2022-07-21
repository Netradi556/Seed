import 'package:seed_app/locator.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/firestore_repo.dart';

class UserControllerBeforeLogin {
  UserControllerBeforeLogin();
  final FireStoreRepo _fireStoreRepo = locator.get<FireStoreRepo>();
  final AuthRepo? _authRepo = locator.get<AuthRepo>();

  // アカウント登録時のドキュメント生成処理
  Future<void> setUserDocument() async {
    _fireStoreRepo.setUserDocument();
  }
}