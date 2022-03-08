import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  freezedを利用してイミュータブルなクラス？でUserオブジェクトを作成して
  Providerを一纏めにするのあり？

*/
final profileNameProvider = StateProvider((ref) => '');
final profileSexProvider = StateProvider((ref) => '');
final profileBirthdateProvider = StateProvider((ref) => '');
final profileBloodtypeProvider = StateProvider((ref) => '');
final profileFamilyProvider = StateProvider((ref) => '');
final profileLanguageProvider = StateProvider((ref) => '');
final profileLivingProvider = StateProvider((ref) => '');
final profileBirthplaceProvider = StateProvider((ref) => '');
final profileEducationProvider = StateProvider((ref) => '');
final profileJobProvider = StateProvider((ref) => '');
final profileIncomeProvider = StateProvider((ref) => '');
final profileHeightProvider = StateProvider((ref) => '');
final profileBodyshapeProvider = StateProvider((ref) => '');

enum UserBasicProfile {
  handleName,
  sex,
  birthDate,
}

final profileFirstRegistrationProvider =
    StateProvider<UserBasicProfile>((ref) => UserBasicProfile.birthDate);
