import 'package:seed_app/repository/auth_repo.dart';
import 'package:seed_app/repository/storage_repo.dart';
import 'package:seed_app/controller/user_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}
