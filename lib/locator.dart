import 'package:seed_app/controller/user_controller_before_login.dart';
import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/firestore_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUpFireBaseServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<FireStoreRepo>(FireStoreRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserControllerBeforeLogin>(
      UserControllerBeforeLogin());
}

void setUpUserController() {
  locator.registerSingleton<UserController>(UserController());
}
