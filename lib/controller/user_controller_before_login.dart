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

  // ハンドルネーム、誕生日、性別の登録時の処理
  Future<void> firstUploadEditedContents(
      Map<String, dynamic> editingContents) async {
    await _fireStoreRepo.updateProfile(editingContents);
    // ignore: avoid_print
    print('到達');
  }
}
