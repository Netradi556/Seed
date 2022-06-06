import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  UserModel? _currentUser;
  final FireStoreRepo _fireStoreRepo = locator.get<FireStoreRepo>();
  final AuthRepo? _authRepo = locator.get<AuthRepo>();
  final StorageRepo? _storageRepo = locator.get<StorageRepo>();

  Future? init;

  UserController() {
    init = initUser();
  }
  UserModel? get currentUser => _currentUser;

  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo?.getUser();
    return _currentUser;
  }

  // プロフィールの項目アップデートの処理============================================
  Future<void> uploadEditedContents(Map<String, String> editingContents) async {
    await _fireStoreRepo.updateProfile(editingContents);
    // ignore: avoid_print
    print('到達');
  }

  Future<void> firstUploadEditedContents(
      Map<String, String> editingContents) async {
    await _fireStoreRepo.setProfile(editingContents);
    // ignore: avoid_print
    print('到達');
  }

  // 画像保存の処理==============================================================

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

  Future<void> saveLocalProfilePicture(File image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // アプリ内ディレクトリへの保存処理
    String fileName = currentUser!.uid.toString();
    String newPath =
        (await getApplicationDocumentsDirectory()).path + '/' + fileName;
    File imageFile = File(newPath);
    await imageFile.writeAsBytes(await image.readAsBytes());

    // avatarUrlの更新
    _currentUser?.avatarUrl = newPath;

    // 次回起動時のためにファイルネームを保存しておく
    prefs.setString('avatarFileName', fileName);
  }

  // アプリ起動時の初期化処理に追加することで、アプリ内パスが変わっても対処
  Future<void> initializeLocalProfilePicturePath() async {
    // アプリ内表示に使用するためにファイルパスを更新
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fileName = prefs.getString('avatarFileName');
    String nowPath =
        (await getApplicationDocumentsDirectory()).path + '/' + fileName!;
    _currentUser?.avatarUrl = nowPath;
  }
}
