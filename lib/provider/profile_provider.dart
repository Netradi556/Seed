import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  freezedを利用してイミュータブルなクラス？でUserオブジェクトを作成して
  Providerを一纏めにするのあり？

*/

// 初回登録
final profileNameProvider = StateProvider((ref) => '');
final profileSexProvider = StateProvider((ref) => '');
final profileBirthdateProvider = StateProvider((ref) => '');

// プロフィールの更新有無チェック
final profileIsChanged = StateProvider<bool>((ref) {
  return false;
});

// 基本情報
final profileBloodTypeProvider = StateProvider((ref) => '');
final profileLanguageProvider = StateProvider((ref) => '');
final profileLivingPlaceProvider = StateProvider((ref) => '');
final profileBirthPlaceProvider = StateProvider((ref) => '');

// 学歴・職種・外見
final profileEducationProvider = StateProvider((ref) => '');
final profileJobProvider = StateProvider((ref) => '');
final profileIncomeProvider = StateProvider((ref) => '');
final profileHeightProvider = StateProvider((ref) => '');
final profileBodyShapeProvider = StateProvider((ref) => '');

// 性格・趣味・生活
final profilePersonalityProvider = StateProvider((ref) => ''); // 性格・タイプ
final profileOffDayProvider = StateProvider((ref) => '');
final profileHobbyProvider = StateProvider((ref) => '');
final profileLivingWithProvider = StateProvider((ref) => '');
final profileSmokeProvider = StateProvider((ref) => '');
final profileDrinkProvider = StateProvider((ref) => '');

// 恋愛・結婚について
final profileHaveChildProvider = StateProvider((ref) => ''); // 子供の有無
final profileMarriageWillProvider = StateProvider((ref) => ''); // 結婚の意志
final profileWantKidsProvider = StateProvider((ref) => ''); // 子供がほしいか
final profileHouseworkProvider = StateProvider((ref) => ''); // 家事・育児
final profileHowMeetProvider = StateProvider((ref) => ''); // 出会うまでの希望
final profileDatingCostProvider = StateProvider((ref) => ''); // 初回デート費用

/* enum UserBasicProfile {
  handleName,
  sex,
  birthDate,
}

final firstRegistrationProvider =
    StateProvider<UserBasicProfile>((ref) => UserBasicProfile.birthDate);
 */