import 'package:flutter_riverpod/flutter_riverpod.dart';

// 初回登録
final profileNameProvider = StateProvider((ref) => '');
final profileSexProvider = StateProvider((ref) => '');
final profileBirthdateProvider =
    StateProvider<DateTime>((ref) => DateTime(1900, 1, 1));
final profileAgeProvider = StateProvider((ref) => 0);

// 画像のアップロードチェック
final profileIsPicUpload = StateProvider.autoDispose<bool>((ref) => false);

// プロフィールの更新有無チェック
final profileIsChanged = StateProvider<bool>((ref) => false);
final profileIsChangedAuto = StateProvider.autoDispose<bool>(((ref) => false));

// プロフィールの編集内容
final profileEditingContents =
    StateProvider.autoDispose<Map<String, String>>((ref) => {});

// 自由記述欄の編集用
final profileAboutProvider = StateProvider.autoDispose((ref) => '');
final profileAboutIsChangedProvider = StateProvider.autoDispose((ref) => false);

// 基本情報
final profileBloodTypeProvider = StateProvider.autoDispose((ref) => '');
final profileLanguageProvider = StateProvider.autoDispose((ref) => '');
final profileLivingPlaceProvider = StateProvider.autoDispose((ref) => '');
final profileBirthPlaceProvider = StateProvider.autoDispose((ref) => '');

// 学歴・職種・外見
final profileEducationProvider = StateProvider.autoDispose((ref) => '');
final profileJobProvider = StateProvider.autoDispose((ref) => '');
final profileIncomeProvider = StateProvider.autoDispose((ref) => '');
final profileHeightProvider = StateProvider.autoDispose((ref) => '');
final profileBodyShapeProvider = StateProvider.autoDispose((ref) => '');

// 性格・趣味・生活
final profilePersonalityProvider =
    StateProvider.autoDispose((ref) => ''); // 性格・タイプ
final profileOffDayProvider = StateProvider.autoDispose((ref) => '');
final profileHobbyProvider = StateProvider.autoDispose((ref) => '');
final profileLivingWithProvider = StateProvider.autoDispose((ref) => '');
final profileSmokeProvider = StateProvider.autoDispose((ref) => '');
final profileDrinkProvider = StateProvider.autoDispose((ref) => '');

// 恋愛・結婚について
final profileHaveChildProvider =
    StateProvider.autoDispose((ref) => ''); // 子供の有無
final profileMarriageWillProvider =
    StateProvider.autoDispose((ref) => ''); // 結婚の意志
final profileWantKidsProvider =
    StateProvider.autoDispose((ref) => ''); // 子供がほしいか
final profileHouseworkProvider =
    StateProvider.autoDispose((ref) => ''); // 家事・育児
final profileHowMeetProvider =
    StateProvider.autoDispose((ref) => ''); // 出会うまでの希望
final profileDatingCostProvider =
    StateProvider.autoDispose((ref) => ''); // 初回デート費用

