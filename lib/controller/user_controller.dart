import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';

class UserController {
  UserModel? _currentUser;
  final FireStoreRepo _fireStoreRepo = locator.get<FireStoreRepo>();
  final AuthRepo? _authRepo = locator.get<AuthRepo>();
  final StorageRepo? _storageRepo = locator.get<StorageRepo>();

  UserModel? get currentUser => _currentUser;

  // UserControllerインスタンス生成時の初期化処理
  Future? init;
  UserController() {
    init = initUser();
  }

  // 呼び出し先のgetUserでuid、handleName、avatarUrlを取得しておく
  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo
        ?.getUser(); // ===================呼び出し先のgetUser()が全部引っくるまってる？？？？
    return _currentUser;
  }

  // アカウント登録時のドキュメント生成処理
  Future<void> setUserDocument() async {
    _fireStoreRepo.setUserDocument();
  }

  // プロフィールの項目アップデートの処理==========================================================================
  Future<void> NEWuploadEditedContents(
      Map<String, String> editingContents) async {
    await _fireStoreRepo.NEWupdateProfile(editingContents);
    // ignore: avoid_print
    print('到達');
  }

  // TODO: mid: プロファイルの修正ページが落ち着いたら消去
  Future<void> uploadEditedContents(Map<String, String> editingContents) async {
    await _fireStoreRepo.OLDupdateProfile(editingContents);
    // ignore: avoid_print
    print('到達');
  }

  //
  //
  //
  //
  //
  //
  // 画像保存の処理============================================================================================
  Future<void> uploadProfilePicture(File image) async {
    // クラウド上への保存処理
    // FireStorageにアップロード
    await _storageRepo!.uploadFile(image);

    // アプリ内ディレクトリへの保存処理
    String fileName = currentUser!.uid.toString();
    String newPath =
        (await getApplicationDocumentsDirectory()).path + '/' + fileName;
    File imageFile = File(newPath);
    await imageFile.writeAsBytes(await image.readAsBytes());

    // 念の為？クラウド上のURLを取得しておく
    _currentUser!.avatarUrlOnCloud = await _storageRepo!.uploadFile(image);
  }
}
