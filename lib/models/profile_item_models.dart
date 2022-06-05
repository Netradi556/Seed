import 'package:seed_app/const/constants_profile.dart' as c;

class ProfileItem {
  final List<String> basicInfo = [
    'ニックネーム',
    '年齢',
    '血液型',
    '話せる言語',
    '居住地',
    '出身地',
  ];
  final List<String> socialInfo = [
    '学歴',
    '職種',
    '年収',
    '身長',
    '体型',
  ];
  final List<String> lifeStyleInfo = [
    '性格・タイプ',
    '休日',
    '趣味・好きなこと',
    '同居している人・ペット',
    '喫煙',
    'お酒',
  ];

  final List<String> viewOfLove = [
    '子供の有無',
    '結婚に対する意思',
    '子供がほしいか',
    '家事・育児',
    '出会うまでの希望',
    'デート費用',
  ];
}

class ProfileItemDetail {
  // ===================
  // 血液型
  final List<String> bloodType = c.bloodType.toList() + ['選択しない', 'default'];

  // 話せる言語
  final List<String> language = c.language.toList() + ['選択しない', 'default'];

  // 居住地
  final List<String> livingPlace =
      c.prefectrure.toList() + ['選択しない', 'default'];

  // 出身地
  final List<String> birthPlace = c.prefectrure.toList() + ['選択しない', 'default'];

  // ===================
  // 学歴
  final List<String> education = c.education.toList() + ['選択しない', 'default'];

  // 職種
  final List<String> job = c.job.toList() + ['選択しない', 'default'];

  // 年収
  final List<String> income = c.income.toList() + ['選択しない', 'default'];

  // 身長
  final List<String> height = c.height.toList() + ['選択しない', 'default'];

  // 体型
  final List<String> bodyShape = c.bodyShape.toList() + ['選択しない', 'default'];

  // ===================
  // 性格・タイプ
  final List<String> personality =
      c.personality.toList() + ['選択しない', 'default'];

  // 休日
  final List<String> offDay = c.offDay.toList() + ['選択しない', 'default'];

  // 好きな食べ物
  final List<String> name = c.prefectrure.toList() + ['選択しない', 'default'];

  // 趣味・好きなこと
  final List<String> hobby = c.hobby.toList() + ['選択しない', 'default'];

  // 同居している人・ペット
  final List<String> livingWith = c.livingWith.toList() + ['選択しない', 'default'];

  // 喫煙
  final List<String> smoke = c.smoke.toList() + ['選択しない', 'default'];

  // お酒
  final List<String> drink = c.drink.toList() + ['選択しない', 'default'];

  // ===================
  // 子供の有無
  final List<String> haveChild = c.haveChild.toList() + ['選択しない', 'default'];

  // 結婚に対する意思
  final List<String> marriageWill =
      c.marriageWill.toList() + ['選択しない', 'default'];

  // 子供がほしいか
  final List<String> wantKids = c.wantKids.toList() + ['選択しない', 'default'];

  // 家事・育児
  final List<String> housework = c.housework.toList() + ['選択しない', 'default'];

  // 出会うまでの希望
  final List<String> howMeet = c.howMeet.toList() + ['選択しない', 'default'];

  // デート費用
  final List<String> datingCost = c.datingCost.toList() + ['選択しない', 'default'];
}
