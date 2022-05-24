import 'dart:io';

import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';

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
    _currentUser!.avatarUrl = await _storageRepo!.uploadFile(image);
  }

  UserModel? get currentUser => _currentUser;
}
