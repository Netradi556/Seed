import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/locator.dart';
import 'package:seed_app/models/user_models.dart';

import 'package:seed_app/ui/user_menu_to_pages/user_profile/introduction.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/introduction_card.dart';

import 'package:seed_app/ui/user_menu_to_pages/user_profile/items_list.dart';
import 'package:seed_app/ui/user_menu_to_pages/user_profile/score.dart';
import 'package:seed_app/controller/user_controller.dart';

/*
  ユーザーのプロフィールを表示する画面
  登録済みのプロフィールを表示する他、ログインステータスの表示も反映する



*/

class UserProfilePageWidget extends ConsumerWidget {
  UserProfilePageWidget({Key? key}) : super(key: key);

  final Color appBarTextColor = const Color.fromARGB(223, 0, 0, 0);
  final Color appBarBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  final List<String> basicInfo = [
    'ニックネーム',
    '年齢',
    '血液型',
    '話せる言語',
    '居住地',
    '出身地',
  ];

  final List<String> lifeStyleInfo = [
    '性格・タイプ',
    '好きな食べ物',
    '趣味・好きなこと',
    'ペット',
    '喫煙',
    'お酒',
  ];

  final List<String> socialInfo = [
    '学歴',
    '職種',
    '年収',
    '身長',
    '体型',
  ];

  final List<String> viewOfLove = [
    '子供の有無',
    '結婚に対する意思',
    '子供がほしいか',
    '家事・育児',
    '出会うまでの希望',
    '初回デート費用',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        // AppBarのデザイン修正
        // SilverAppBarに変更、丸みを帯びたデザインに変更
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          elevation: .6,
          title: Text('マイプロフィール', style: TextStyle(color: appBarTextColor)),
          backgroundColor: appBarBackgroundColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                stops: [0, 1],
                begin: AlignmentDirectional(0.34, -1),
                end: AlignmentDirectional(-0.34, 1),
              ),
            ),
          ),
        ),

        // プロフの項目別にWidget切り出し→実装
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // プロフ画像
              ProfilePictures(
                avatarUrl: _currentUser?.avatarUrl,
              ),
              // 概要欄
              const IntroductionCard(),
              // プロフィールスコア
              ProfileScore(),
              // 自由記述欄
              Introduction(),
              // 基本情報
              ProfileItemsList(
                itemName: '基本情報',
                itemsList: basicInfo,
              ),
              // 学歴・職種・外見
              ProfileItemsList(
                itemName: '学歴・職種・外見',
                itemsList: socialInfo,
              ),
              // 性格・趣味・生活
              ProfileItemsList(
                itemName: '性格・趣味・生活',
                itemsList: lifeStyleInfo,
              ),
              // 恋愛・結婚について
              ProfileItemsList(
                itemName: '恋愛・結婚について',
                itemsList: viewOfLove,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 完成---------------------------------------------------------------------------------------------
// プロフィール画像
class ProfilePictures extends ConsumerWidget {
  final String? avatarUrl;
  ProfilePictures({
    this.avatarUrl,
    Key? key,
  }) : super(key: key);

  final UserModel? _currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: Container(
        height: 400,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: avatarUrl == null
                  ? Image.asset('assets/images/user1.jpg').image
                  : Image.file(File(avatarUrl!)).image,
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
