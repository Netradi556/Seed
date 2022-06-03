import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  UserModel? _currentUser;
  final AuthRepo? _authRepo = locator.get<AuthRepo>();
  final StorageRepo? _storageRepo = locator.get<StorageRepo>();

  Future? init;

  UserController() {
    init = initUser();
  }

  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo?.getUser();
    return _currentUser;
  }

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
    print('ここまで');
    // アプリ内ディレクトリへの保存処理
    String fileName = currentUser!.uid.toString();
    String newPath =
        (await getApplicationDocumentsDirectory()).path + '/' + fileName;
    print(fileName.toString());
    print(newPath);
    File imageFile = File(newPath);
    await imageFile.writeAsBytes(await image.readAsBytes());

    // avatarUrlの更新
    _currentUser?.avatarUrl = newPath;
    print(_currentUser?.avatarUrl.toString());

    // 次回起動時のためにファイルネームを保存しておく
    prefs.setString('avatarFileName', fileName);
    print('成功？');
    print(prefs.getString('avatarFileName'));
  }

// アプリ起動時の初期化処理に追加することで、アプリ内パスが変わっても対処
  Future<void> initializeLocalProfilePicturePath() async {
    // アプリ内表示に使用するためにファイルパスを更新
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fileName = prefs.getString('avatarFileName');
    print(prefs.getString('avatarFileName'));
    String nowPath =
        (await getApplicationDocumentsDirectory()).path + '/' + fileName!;
    _currentUser?.avatarUrl = nowPath;
    print(nowPath.toString());
    print('実行された');
    print(_currentUser?.avatarUrl.toString());
  }

  UserModel? get currentUser => _currentUser;
}
