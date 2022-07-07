import 'package:seed_app/const/constants_profile.dart' as c;

// TODO: 1. Firestore param <-> 項目名のMapを定義
// TODO: 2. ProfileItemのListを項目名のクラスのFirestore param版を作成
// TODO: 3. up_items_lists.dartにFirestore paramが渡されるので、Mapを利用する

class ProfileItemMap {
  final Map<String, dynamic> paramItemName = {
    'handleName': 'ハンドルネーム',
    'age': '年齢',
    'sex': '性別',
    'bloodType': '血液型',
    'language': '話せる言語',
    'livingPlace': '居住地',
    'birthPlace': '出身地',
    'education': '学歴',
    'job': '職種',
    'income': '年収',
    'height': '身長',
    'bodyShape': '体型',
    'personality': '性格・タイプ',
    'offDay': '休日',
    'hobby': '趣味・好きなこと',
    'livingWith': '同居している人・ペット',
    'smoke': '喫煙',
    'drink': 'お酒',
    'haveChild': '子供の有無',
    'marriageWill': '結婚に対する意思',
    'wantKids': '子供がほしいか',
    'hoseWork': '家事・育児',
    'howMeet': '出会うまでの希望',
    'datingCost': 'デート費用',
  };
}

class ProfileItemParam {
  // 'sex'パラメータは項目として表示しないので、このリストに含ませない
  final List<String> basicInfo = [
    'handleName',
    'age',
    'bloodType',
    'language',
    'livingPlace',
    'birthPlace',
  ];

  final List<String> socialInfo = [
    'education',
    'job',
    'income',
    'height',
    'bodyShape',
  ];

  final List<String> lifeStyleInfo = [
    'personality',
    'offDay',
    'hobby',
    'livingWith',
    'smoke',
    'drink',
  ];

  final List<String> viewOfLove = [
    'haveChild',
    'marriageWill',
    'wantKids',
    'hoseWork',
    'howMeet',
    'datingCost',
  ];
}

class ProfileItemJAP {
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

class InitialProfileParam {
  final Map<String, dynamic> initialParamTop = {
    'handleName': '',
    'age': 0,
    'sex': '',
    'score': 0,
    'receivedGoodCount': 0,
    'bloodType': '',
    'language': '',
    'livingPlace': '',
    'birthPlace': '',
    'education': '',
    'job': '',
    'income': '', // TODO: int型にしないと、検索条件に引っ掛けられない？？
    'height': '', // TODO: int型にしないと、検索条件に引っ掛けられない？？
    'bodyShape': '',
    'personality': '',
    'offDay': '',
    'hobby': '',
    'livingWith': '',
    'smoke': '',
    'drink': '',
    'haveChild': '',
    'marriageWill': '',
    'wantKids': '',
    'hoseWork': '',
    'howMeet': '',
    'datingCost': '',
  };

  final Map<String, dynamic> initialParamMemberStatus = {
    //
    'goodCount': 0,
    'licenseType': '',
    'entryDate': DateTime.now(),
    'nextGivenDate': DateTime.now(), // TODO: TOP画面遷移時に設定
    'birthDate': DateTime.now(), // TODO: 後で設定
  };
}
